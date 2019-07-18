require_relative '../lib/mairie_christmas.rb'


describe "marie chrsitmas" do
    describe "the html open url function :" do
        it "should return the annuaire des mairies page" do
            expect(html_open_url).to be
        end
    end

    describe "the get_price function :" do
        describe "should return city in an array" do
            describe get_citys do
                it { should be_kind_of(Array) }
            end
        end
    end  
end