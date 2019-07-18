require_relative '../lib/02_deputes'

describe "get_url method include names and mail" do 
	it "should return many politics names" do 
		expect($final_hash.include?("Damien")).to eq(true)
	end 
	it "should return many mail adress" do 
		expect($final_hash.include?("damien.abad@assemblee-nationale.fr")).to eq(true)
	end 
end 