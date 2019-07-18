#require gems for app
require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

    attr_accessor :page_url
    def initialize(page)
        @page_url = page
    end

    def scraping_who
        doc = Nokogiri::HTML(open(@page_url))
    end

    def scraping_xpath(elem)
        result = scraping_who.xpath(elem)
    end

    def scraping_css(elem)
        result = scraping_who.css(elem)
    end

    def scraping_search(elem)
        result = scraping_who.search(elem)
    end

    def put_in_array(elem)
        array = []
        elem.each {|e|  array << e.text}
        return array
    end

    def put_in_hash(array1, array2, nb=array1.length)
        hash = Hash.new
        nb.times {|a| hash[array1[a]] = array2[a]}
        return hash
    end
end

