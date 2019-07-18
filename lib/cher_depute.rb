require 'pry'
require 'nokogiri'
require 'open-uri'

#ouvre la page nos depute, on recupere les valeurs href par le xpath dans un tableau que l on return
def return_url
  url = []
doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  doc.xpath('//td/a').each do |i|
    url << i['href']
  end
  print url
  return url
end

#pour chaque lien nous allons allez sur sa page html et recuperer son nom prenom et email que l on push ensuite dans un hash 
def deputy_info(urls)
  liste_deputes = []
  urls.each do |url|
    hash = {}
    doc = Nokogiri::HTML(open("https://www.nosdeputes.fr#{url}"))
    name_depute =  (doc.xpath('//h1').text.split())
    print name_depute
    hash[:first_name] = name_depute[0]
    hash[:last_name] =  name_depute[1]
    hash[:email] =  doc.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a').text
    liste_deputes << hash
  end
  return liste_deputes
end

puts "cher depute"
puts "please wait"
puts deputy_info(return_url)