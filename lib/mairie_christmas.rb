#require gems for app
require 'pry'
require 'nokogiri'
require 'open-uri'


def html_open_url
    #annuaire des mairires
    page_url = "http://annuaire-des-mairies.com/val-d-oise.html"
    doc = Nokogiri::HTML(open(page_url))
end

#recupere toute les villes de la page val d oise et les met dans un tableau
def get_citys
    city_array = []
    citys = html_open_url.css('a.lientxt[href]').each {|c| city_array << c.text.downcase.gsub(' ', '-')}
    return city_array
end

#recupere les emails de chaque ville
def get_email_town(array)
    city_email_hash = {}
    array.each do |c| 
        #permet de lire la page de chaque villes
        c_open = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{c}.html"))
        email = c_open.css('td')[7]
        city_email_hash[c] = email.text
    end
    return city_email_hash
end

puts "mairie chrstmas"
puts "please wait"
puts get_email_town(get_citys)
