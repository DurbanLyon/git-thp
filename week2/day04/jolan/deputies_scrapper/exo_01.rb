require 'nokogiri'
require 'open-uri'

@accueil = "http://www2.assemblee-nationale.fr"

def create_hash(key, value)
    new_hash = Hash[key.zip value]
    return new_hash
end

def parse_deputies_name() 
    doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))

    content = Array.new
    doc.xpath('//td//a').each do | link |
        content.push(link.content)
    end
    content
end

def parse_deputies_email(url) 
    doc = Nokogiri::HTML(open(url))

    content = Array.new
    doc.xpath('//li//a').each do | link |
        if link.values[0].include?('mailto:')
            content = link.values[0][7..-1]
        end
    end
    return content
end

def get_email(url)
    content = Array.new
    url.each do | link |
        content << parse_deputies_email(link)
    end
    return content
end

def get_url(accueil) 
    doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
        
    content = Array.new
    doc.xpath('//td//a').each do | link |
        content << accueil + link.values[0] if  link.values[0].include?('/deputes')
    end
    return content
end

def launcher()
    email = get_email(get_url(@accueil))
    name = parse_deputies_name()

    hash = create_hash(name, email)
    hash.each do | key, value |
        puts "[NAME]:[#{key}]"
        puts "[EMAIL]:[#{value}]"
        puts "\n"
    end
end

launcher()