require 'nokogiri'
require 'open-uri'
require 'pry'

@doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))

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