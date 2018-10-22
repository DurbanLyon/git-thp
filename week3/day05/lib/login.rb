class LogIn
    def initialize()
        @login = 'qweqwe'
        @password = 'abc'
        @root = Root.new
        @root.header_launcher()
    end

    def preload()
        print '  Do you want to sign in ? '
        puts '(' + 'Y'.green + '/' + 'n'.red + ')'
        print '> '
        tmp = gets.chomp.downcase
        if tmp == 'y'
            puts '  Please type your password'
            print '> '
            tmp_password = gets.chomp
            if tmp_password == @password
                puts '  You are now logged in'.green
                print '  Please type '
                print '-help '.blue
                puts 'to see command tools'
                @root.perform()
            else
                puts '  Password is wrong'.red
                exit
            end
        elsif tmp == 'n'
            puts '  Sign in canceled'.red
            exit
        else
            puts '  Error'.red
            exit
        end
    end
end