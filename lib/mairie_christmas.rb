require_relative '../lib/app.rb'

#la page annuaire a analyse
commun = "val-d-oise"
comm_num = "95"
page = "http://annuaire-des-mairies.com/#{commun}.html"

#creer mon objet scraper pour appeler mes methodes
scraper = Scraper.new(page)
#tableau pour les villes et emails
city_email_hash = Hash.new
#recupere toute les villes de la page val d oise
citys = scraper.scraping_css('a.lientxt')
city_array = scraper.put_in_array(citys)

#recupere les emails de chaque ville
city_array.each do |c| 
    c = c.downcase.gsub(' ', '-')
    #permet de ce login 
    url = "http://annuaire-des-mairies.com/95/#{c}.html"
    doc = Nokogiri::HTML(open(url))
    email = doc.css('td')[7]
    city_email_hash[c] = email.text
end
print city_email_hash
