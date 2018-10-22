require 'controller'

class View
    def create_post()
        puts '  Please type a username'
        author = gets.chomp
        puts '  Please type a content'
        content = gets.chomp

        return params = { 'author': author, 'content': content }
    end

    def display()
        puts
        puts "========= POTINS.FR ==========="
        puts "Auteurs        Potins"
        hash_gossips.each { |author,content|
            puts "#{author}         : #{content}" }
        puts "==============================="
        puts
    end
end