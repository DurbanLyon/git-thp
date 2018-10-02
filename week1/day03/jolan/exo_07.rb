def define_password
    puts "Please choose a password"
    print "> "
    password = gets.chomp
    @user_password = password
    return @user_password
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
            puts "You are now logged in (use CTRL+C to logout)"
            i = 0
            while i
                i += 1
            end
        else
            puts "Password is wrong"
        end
    elsif tmp == "n"
        puts "Sign in canceled"
    else
        puts "Error"
    end
end

password = define_password()
check = verif_password(password)
access = perform(password, check)

if access == true
    connect(password)
else
    puts "There is an error with your password"
    puts "Please retry"
end