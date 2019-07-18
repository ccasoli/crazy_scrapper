#require gems for app
require 'pry'
require 'nokogiri'
require 'open-uri'

#fonction qui push tout elements recuperer dans un tableau
def put_in_array(elem)
    array = []
    elem.each {|e|  array << e.text}
    return array
end

#fonction qui creer un Hash avec key array1 , value array2, initialiser avec la taille d un tableau
def put_in_hash(array1, array2, nb=array1.length)
    hash = {}
    nb.times {|a| hash[array1[a]] = array2[a]}
    return hash
end



#ouverture du ficher on y place les element html dedand doc
def html_open_url
    #coin market
    page_url = "https://coinmarketcap.com/all/views/all/"
    doc = Nokogiri::HTML(open(page_url))
end

#tableau pour symbol et prix
symbol_array = []

#recupere les prix et les met dans un tableau 
def get_prices
    prices = html_open_url.css("a.price")
    price_array = put_in_array(prices)
    price_array.each do |i| 
        i.delete!('$')
        sprintf("%.2f", i.to_f) 
    end
    return price_array
end

#recupere les symbols et les met dans un tableau 
def get_symbols
    symbols = html_open_url.css("td.col-symbol")
    symbol_array = put_in_array(symbols)
end


#met la valeur du 1er tableau comme clef de la valeur du 2eme tableau (optinal 3eme argument(integer) = recupere un nb definit a partir du premier)
def the_hash
    puts put_in_hash(get_symbols, get_prices, 20)
end

puts "dark trader"
the_hash