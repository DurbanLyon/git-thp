require 'controller'
require 'colorize'

class Root
    def initialize()
        @controller = Controller.new
    end

    def header_launcher()
        print "\n\n\n"
        header = File.read('misc/header.txt')
        puts header
        print "\n\n\n"
    end

    def perform()
        header_launcher()
        puts '  Please type -help, to show command !'

        i = 0
        while i
            if i == '-help'
                puts '  You can use some different command'
                puts '      -create : create content'
                puts '      -show : show content'
                puts '      -delete : delete content'
                puts '      -logout : quit TGP'
            end
            if i == '-create'
                puts '  You choose to create content !'
                @controller.create_post()
            end
            if i == '-show'
                puts '  You choose to show content !'
                @controller.show_post()
            end
            if i == '-delete'
                puts '  You choose to delete content !'
                @controller.delete_post()
            end
            if i == '-logout'
                puts '  You are now disconnected'.green
                exit
            end
            print '> '
            i = gets.chomp.downcase
        end
    end
end