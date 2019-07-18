require_relative '../lib/app.rb'

describe "Scraper" do 
    scraper = Scraper.new("https://coinmarketcap.com/all/views/all/")
    describe "the scraping_who function :" do
        it "should return the open page" do
            expect(scraper.scraping_who).to be
        end
    end

    describe "the scraping_what function :" do
        describe "should return element" do
            it "h1" do
                expect(scraper.scraping_xpath("//h1")).to be
            end 
            it "a" do
                expect(scraper.scraping_xpath("//a")).to be
            end
        end
        describe "should return css" do
            it "div with class container" do
                expect(scraper.scraping_css('div.container')).to be
            end
            it "a with class price" do
                expect(scraper.scraping_css("a.price")).to be
            end
        end
    end  
end
