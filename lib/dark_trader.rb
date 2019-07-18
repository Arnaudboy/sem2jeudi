require'nokogiri'
require'open-uri'
require'pry'

tab_prices = []
tab_currencies = []

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

page.xpath('//a[@class="price"]').each do |node|
	tab_prices << node.text
end

page.xpath('//a[@class="currency-name-container link-secondary"]').each do |node|
	tab_currencies << node.text
end

Hash[*tab_currencies.zip(tab_prices).flatten].each do |val, key|
	puts (" { #{val}  => #{key} }")
end