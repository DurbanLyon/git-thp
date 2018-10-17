def ask_name
    puts "Please type your first name"
    print "> "
    first_name = gets.chomp
    return(first_name)
end

def hello(string)
    puts "Hello #{string}!"
end

name = ask_name()
hello(name)