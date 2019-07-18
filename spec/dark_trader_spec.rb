require_relative '../lib/dark_trader.rb'


describe "dark trader" do 
    describe "the html open url function :" do
        it "should return the coin market page" do
            expect(html_open_url).to be
        end
    end

    describe "the get_price function :" do
        describe "should return price in an array" do
            describe get_prices do
                it { should be_kind_of(Array) }
            end
        end
    end  
end
