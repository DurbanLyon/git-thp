require 'nokogiri'
require 'open-uri'
require 'pry'

# Fetch and parse HTML document
@doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))

def example()
    puts "### Search for nodes by css"
    doc.css('txt-primary tr-last', 'td').each do |link|
    puts link.content
    end

    puts "### Search for nodes by xpath"
    doc.xpath('//txt-primary//tr-last', '//td//h2').each do |link|
    puts link.content
    end

    puts "### Or mix and match."
    doc.search('nav ul.menu li a', '//article//h2').each do |link|
    puts link.content
    end
end

def parse()
    content = Array.new
    @doc.search('txt-primary tr-last', 'td').each do | link |
        content.push(link.content)
    end

    i = 0
    len = content.length - 1
    mail = String.new
    while i <= len
        mail = content[i + 1] if content[i] == "Adresse Email"
        i += 1
    end
    puts mail
end

parse()