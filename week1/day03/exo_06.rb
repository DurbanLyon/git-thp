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
        puts "Your password is verified"
    else
        puts "There is an error with your password"
        puts "Please retry"
    end
end


password = define_password()
check = verif_password(password)

perform(password, check)