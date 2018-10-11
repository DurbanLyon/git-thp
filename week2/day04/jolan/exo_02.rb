require 'nokogiri'
require 'open-uri'
require 'pry'

def create_hash(key, value)
    new_hash = Hash[key.zip value]
    return new_hash
end

def parse_townhalls()
    doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

    content = Array.new
    doc.search('lientxt', 'a').each do | link |
        content.push(link.content)
    end

    len = content.length - 1
    content = content[8..len - 1]
    return content
end

def get_url(content)
    url_value = Array.new
    content.each do | elem |
        elem.downcase!
        match = ' '
        while elem.include?(match)
            elem.sub!(match,'-')
        end
        url_value << "http://annuaire-des-mairies.com/95/" + elem + ".html"
    end
    return url_value
end

def parse_mail(url)
    mail_array = Array.new
    url.each do | elem |
        new_doc = Nokogiri::HTML(open(elem))

        content = Array.new
        new_doc.search('txt-primary tr-last', 'td').each do | link |
            content.push(link.content)
        end
    
        i = 0
        len = content.length - 1
        mail = String.new
        while i <= len
            mail = content[i + 1] if content[i] == "Adresse Email"
            i += 1
        end
        mail_array << mail
    end
    return mail_array
end

def launcher()
    key = parse_townhalls
    content = parse_townhalls()

    url = get_url(content)
    mail = parse_mail(url)

    hash = create_hash(key, mail)
    puts hash
end

launcher()