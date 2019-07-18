require'nokogiri'
require'open-uri'
require'pry'

def get_email(uri)
	 url = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes#{uri}"))
	    url.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |adresse|
	       adresse.text
	       return adresse.text
        end 
end

def get_url
tab_nom = []
tab_url = []
tab = []
final_tab = []
	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

page.xpath('//a').each do |node| 

	puts tab_url << node['href']
	tab_nom << node.text
end

tab_url.each do |node|
	tab << get_email(node)
end
#	final_hash = Hash[*tab_ville.zip(tab).flatten]
#		final_hash.each do |val, key|
#			 final_tab << ("{ #{val} => #{key} }" )
#		end 
end
get_url