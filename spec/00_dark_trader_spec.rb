require_relative '../lib/dark_trader'

describe "Dark_Trader method include names" do 
	it "should return many cryptomoney names" do 
		expect($dark_trader.include?("Bitcoin")).to eq(true)
	end 
	it "should return many cryptomoney names" do 
		expect($dark_trader.include?("Ethereum")).to eq(true)
	end 
	it "should return many cryptomoney names" do 
		expect($dark_trader.include?("XRP")).to eq(true)
	end 
end 
 describe "Dark_trader names have values" do
 	it "should return a value" do 
 		expect(($dark_trader["Bitcoin"] != nil)  && ($dark_trader["Bitcoin"] != 0)).to eq(true)
 	end
 	it "should return a value" do 
 		expect(($dark_trader["Ethereum"] != nil)  && ($dark_trader["Ethereum"] != 0)).to eq(true)
 	end 
 	it "should return a value" do 
 		expect(($dark_trader["XRP"] != nil)  && ($dark_trader["XRP"] != 0)).to eq(true)
 	end  
 end 

 describe "Dark_trader size" do 
 	it "should be superior to 100" do
 		expect($dark_trader.size >  100).to eq(true)
 	end 
 end 