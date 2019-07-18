require'nokogiri'
require'open-uri'
require'pry'

def get_email(uri)
	 url = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{uri}"))
begin	   
	    url.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |adresse|
	       adresse.text
	    	("adresse email => #{adresse.text} } ")
	         rescue NoMethodError => e
    puts "#{names.join(' ')} n'a pas d'email!"
    	end
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
		final_tab << ("{ first_name => #{cut[1]}")
		final_tab << (" last_name => #{cut[2]}")
	end
end

tab_url.each do |node|
	final_tab_mail << get_email(node)
end

	 $final_hash = Hash[*final_tab.zip(final_tab_mail).flatten]
		$final_hash.each do |val, key|
			ending_tab << ("{ #{val} \n #{key} }" )
		end
	return $final_hash 
end
get_url
