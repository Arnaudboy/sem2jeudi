require'nokogiri'
require'open-uri'
require'pry'

def get_email(uri)
	 url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com#{uri}"))
	    url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |adresse|
	       adresse.text
	       return adresse.text
        end 
end

def get_url
tab_ville = []
tab_url = []
tab = []
final_tab = []
	page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/val-d-oise.html'))

page.xpath('//a[@class = "lientxt"]').each do |node| 
	tab_url << node['href'].to_s.delete_prefix(".")
	tab_ville << node.text
end

tab_url.each do |node|
	tab << get_email(node)
end
	final_hash = Hash[*tab_ville.zip(tab).flatten]
		final_hash.each do |val, key|
			puts final_tab << ("{ #{val} => #{key} }" )
		end 
end
get_url