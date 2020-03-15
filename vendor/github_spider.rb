require 'nokogiri'
require "httparty"
require 'byebug'

def getNumber(element)
  result = element.text.match('\d+')

  if result
    return result[0].to_i
  else
    return 0
  end
end

def getPrice(element)
  result = element.text.match('\$\s*\d+,\d+')

  if result
    return result[0][1..-1].sub(',', '').to_i
  else
    return 0
  end
end

def cleanText(element)
  element.delete("\n").strip
end

def scrapper(type)
    if type.zero?
      url = "https://www.lamudi.com.mx/casa/for-rent/"
    elsif type == 1
      url = "https://www.lamudi.com.mx/departamento/for-rent/"
    end

    unparsed = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed)
    jobs = Array.new
    job_listing = parsed_page.css('.ListingCell-wrapper')
    job_listing.each_with_index do |listing, index|
        break if index > 0
        sub_url = listing.css('.js-listing-link')[0].to_h['href']
        if sub_url
            unparsed_sub = HTTParty.get(sub_url)
            parsed_sub = Nokogiri::HTML(unparsed_sub)
            bathrooms = parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(3) .last').text.match('\d+')
            parking = getNumber(parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(2) .last'))
            description = parsed_sub.css('.ViewMore-text-description').text
        end
        sleep 2
        job = {
            pictures: listing.css('.ListingCell-image img')[0].to_h['data-src'],#.attributes
            kind_of_property: type.zero? ? "casa" : "departamento",
            title: cleanText(listing.css('h3').text),
            address: cleanText(listing.css(".ListingCell-KeyInfo-address").text),
            map: "",
            rooms: getNumber(listing.css(".icon-bedrooms + span")),
            bathrooms: bathrooms ? bathrooms[0].to_i : 1,
            availability: Time.new,
            price: getPrice(listing.css(".PriceSection-FirstPrice")),
            fees: 0,
            size: getNumber(listing.css(".icon-livingsize + span")),
            parking: parking ? true : false,
            pets: false,
            furnished: false, 
            description: cleanText(description),
            landlord_id: 0
        }
        jobs << job
    end
    jobs
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
scrapper(1)
scrapper(0)