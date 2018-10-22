require 'csv'

class SignIn
    def initalize()
        @username = define_username()
    end

    def save_data()
        hash = { @users => @content }
        CSV.open('db/gossip.csv', 'a') do | csv |
            csv << [ 'USER', 'CONTENT' ]
            hash.each do | key, value | 
                csv << [ key, value ]
            end
        end
    end

    def define_username
        puts "Please choose a username"
        print "> "
        username = gets.chomp.downcase
        return username
    end

    def define_password
        puts "Please choose a password"
        print "> "
        password = gets.chomp
        $password = password
        return $password
    end

    def verif_password(password)
        puts "Please type your password again"
        print "> "
        check = gets.chomp
        if password == check
            return true
        end
        return false
    end

    def perform(password, check)
        if check == true
            user_password = password
            return true
        end
        return false
    end

    def launcher()
        password = define_password()
        check = verif_password(password)
        access = perform(password, check)

        if access == true
            connect(password)
        else
            puts "There is an error with your password"
            puts "Please retry"
        end
    end
end