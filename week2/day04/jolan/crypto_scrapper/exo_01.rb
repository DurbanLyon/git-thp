require 'nokogiri'
require 'open-uri'
require 'pry'

def create_hash(key, value)
    new_hash = Hash[key.zip value]
    return new_hash
end

def parse_crypto_symbol()
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

    content = Array.new
    doc.css("td[class=\"text-left col-symbol\"]").each do | link |
        content.push(link.content)
    end
    return content
end

def parse_crypto_value()
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

    content = Array.new
    doc.css("a[class=\"price\"]").each do | link |
        content.push(link.content)
    end
    return content
end

def display(node, id)
    node.each do | key, value |
        if key.downcase == id.downcase
            puts "[CURRENCY]:[#{key}]"
            puts "[VALUE]:[#{value}]"
            puts "\n"
        end
    end
end

def launcher()
    symbol = parse_crypto_symbol()
    value = parse_crypto_value()

    node = create_hash(symbol, value)

    puts "This program allow you to see the actual price of any cryptocurrency on the market"
    puts "      - Please set time of data reload in second (min:0, max:3600)"
    print "> "
    nb = gets.chomp.to_i
    print "\n"
    if nb >= 0 && nb <= 3600
        puts "      -Please type the symbol of the cryptocurrency you're looking for"
        print "> "
        id = gets.chomp.downcase
        while true
            display(node, id)
            sleep nb
        end
    else
        puts "Error, please retry"
        exit
    end
end

launcher()