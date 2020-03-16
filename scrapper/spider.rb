require 'nokogiri'
require 'httparty'
require 'byebug'

def get_number(element)
  result = element.text.match('\d+')

  if result
    return result[0].to_i
  else
    0
  end
end

def get_price(element)
  result = element.text.match('\$\s*\d+,\d+')

  if result
    return result[0][1..-1].sub(',', '').to_i
  else
    0
  end
end

def clean_text(element)
  element.delete("\n").strip
end

def scrapper(type, page)
  if type.zero?
    url = "https://www.lamudi.com.mx/casa/for-rent/?page=#{page}"
  elsif type == 1
    url = "https://www.lamudi.com.mx/departamento/for-rent/?page=#{page}"
  end

    unparsed = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed)
    jobs = Array.new
    job_listing = parsed_page.css('.ListingCell-wrapper')
    job_listing.each_with_index do |listing, index|
      break if index > 25
        sub_url = listing.css('.js-listing-link')[0].to_h['href']
        if sub_url
          unparsed_sub = HTTParty.get(sub_url)
          parsed_sub = Nokogiri::HTML(unparsed_sub)
          bathrooms = parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(3) .last').text.match('\d+')
          parking = get_number(parsed_sub.css('.listing-card .medium-6').css('.columns-2:nth-child(2) .last'))
          description = parsed_sub.css('.ViewMore-text-description').text
          imgs = []
          parsed_sub.css('.swiper-wrapper')[0].css('img').each do |img|
            imgs << img.to_h['data-src']
          end
        end
        sleep 2
        job = {
          pictures: imgs,
          kind_of_property: type.zero? ? "casa" : "departamento",
          title: clean_text(listing.css('h3').text),
          address: clean_text(listing.css(".ListingCell-KeyInfo-address").text),
          map: '',
          rooms: get_number(listing.css(".icon-bedrooms + span")),
          bathrooms: bathrooms ? bathrooms[0].to_i : 1,
          availability: Time.new,
          price: get_price(listing.css(".PriceSection-FirstPrice")),
          fees: 0,
          size: get_number(listing.css(".icon-livingsize + span")),
          parking: parking ? parking : 0,
          pets: false,
          furnished: false,
          views: 0,
          description: clean_text(description),
          landlord_id: 1
        }
        jobs << job
    end
    jobs
end
