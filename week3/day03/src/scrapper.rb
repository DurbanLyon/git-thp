require 'nokogiri'
require 'open-uri'

class Scrapper 
    def initialize()
    end

    def create_hash(key, value)
        new_hash = Hash[key.zip value]
        return new_hash
    end

    def get_data()
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

    def get_mail(url)
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
        from_key = get_data()
        from_content = get_data()
        from_url = get_url(from_content)
        from_mail = get_mail(from_url)

        hash = create_hash(from_key, from_mail)
        return hash
    end
end