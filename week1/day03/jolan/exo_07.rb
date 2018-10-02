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
        @user_password = password
        return true
    end
    return false
end

def connect(password)
    puts "Do you want to sign in ? (Y/n)"
    print "> "
    tmp = gets.chomp
    if tmp == "Y"
        puts "Please type your password"
        print "> "
        tmp_password = gets.chomp
        if tmp_password == password
            puts "You are now logged in"
            puts "Please type -help to see command tools"
            init()
        else
            puts "Password is wrong"
            exit
        end
    elsif tmp == "n"
        puts "Sign in canceled"
        exit
    else
        puts "Error"
        exit
    end
end

def help()
    print "\n"
    puts "  -help -- use help to see command tools"
    puts "  -show -- use show to print your password"
    puts "  -chan -- use chan to change your password"
    puts "  -exit -- use exit to logout"
    print "\n"
end

def show()
    print "\n"
    puts "  -show -- Your actual password is #{@user_password}"
    print "\n"
end

def chan()
    print "\n"
    puts "  -chan -- You make a request to change your password, you will be disconnected"
    puts "      loading, please wait"
    print "\n"
    
    password = define_password()
    check = verif_password(password)
    access = perform(password, check)

    if access == true
        print "\n"
        puts "  -chan -- Your password has been changed, use -show to see the changes"
        print "\n"
    else
        print "\n"
        puts "  -chan -- Error has occured, please retry ..."
        print "\n"
    end
end

def init()
    i = 0
    while i
        if i == "-help"
            help()
        end
        if i == "-show"
            show()
        end
        if i == "-chan"
            chan()
        end
        if i == "-exit"
            puts "You are now disconnected"
            exit
        end
        print "> "
        i = gets.chomp
    end
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

launcher()