require'nokogiri'
require'open-uri'
require'pry'

def get_email(uri)
	 url = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{uri}"))
	    url.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |adresse|
	       adresse.text
	       return ("adresse email = #{adresse.text}")
        end
end

def get_url
tab_nom = []
tab_url = []
tab = []
final_tab = []
final_tab_mail = []
ending_tab = []
	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

page.xpath('//*[@id="deputes-list"]/div/ul/li/a').each do |node| 
tab_url << node['href']
tab_nom << node.text
	
	tab_nom.each do |name|
		cut = name.split
		final_tab << ("prenom = #{cut[1]}")
		final_tab << ("nom = #{cut[2]}")
	end
end

tab_url.each do |node|
	final_tab_mail << get_email(node)
end

	final_hash = Hash[*final_tab.zip(final_tab_mail).flatten]
		final_hash.each do |val, key|
			puts ending_tab << ("{ #{val} => #{key} }" )
		end 
end
get_url