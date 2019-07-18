require_relative '../lib/app.rb'


#la page bitcoin a analyse
page = "https://coinmarketcap.com/all/views/all/"

#creer mon objet scraper pour appeler mes methodes
scraper = Scraper.new(page)
#tableau pour symbol et prix
symbol_array = []
price_array = []

#recupere les symbols avec scraping css ici class=col-symbol est dans balise td
symbols = scraper.scraping_css("td.col-symbol")
symbol_array = scraper.put_in_array(symbols)
#recupere les prix avec scraping css ici class=price est dans balise a
prices = scraper.scraping_css("a.price")
price_array = scraper.put_in_array(prices)

#met la valeur du 1er tableau comme clef de la valeur du 2eme tableau (optinal 3eme argument(integer) = recupere un nb definit a partir du premier)
symbol_price_hash = scraper.put_in_hash(symbol_array, price_array)
puts symbol_price_hash