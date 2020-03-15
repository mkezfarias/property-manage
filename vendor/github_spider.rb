require 'nokogiri'
require "httparty"
require 'byebug'

def scrapper
    url = "https://www.lamudi.com.mx/casa/for-rent/"
    unparsed = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed)
    jobs = Array.new
    job_listing = parsed_page.css('.ListingCell-wrapper')
    job_listing.each_with_index do |listing, index|
        break if index > 24
        sub_url = listing.css('.js-listing-link')[0].to_h['href']
        if sub_url
            unparsed_sub = HTTParty.get(sub_url)
            parsed_sub = Nokogiri::HTML(unparsed_sub)
            bathrooms = parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(3) .last').text.match('\d+')
            parking = parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(2) .last').text.match('\d+')
            description = parsed_sub.css('.ViewMore-text-description').text
        end
        sleep 2
        job = {
            pictures: listing.css('.ListingCell-image img')[0].to_h['data-src'],#.attributes
            kind_of_property: "casa",
            title: listing.css('h3').text.delete("\n").strip,
            address: listing.css(".ListingCell-KeyInfo-address").text.delete("\n").strip,
            map: "",
            rooms: listing.css(".icon-bedrooms + span").text.match('\d+'),
            bathrooms: bathrooms ? bathrooms[0] : 1,
            availability: Time.new,
            price: listing.css(".PriceSection-FirstPrice").text.match('\$\s*\d+,\d+'),
            fees: 0,
            size: listing.css(".icon-livingsize + span").text.match('\d+'),
            parking: parking ? true : false,
            pets: false,
            furnished: false, 
            description: description.delete("\n").strip
        }
        jobs << job
    end
    p jobs
end
=begin
    t.string 'kind_of_property'
    t.string 'title'
    t.string 'address'
    t.string 'map'
    t.integer 'rooms'
    t.integer 'bathrooms'
    t.date 'availability'
    t.integer 'price'
    t.integer 'fees'
    t.integer 'size'
    t.integer 'parking'
    t.boolean 'pets'
    t.boolean 'furnished'
    t.text 'description'
    t.integer 'views'
    t.string 'pictures'
    t.integer 'landlord_id'
=end
scrapper()