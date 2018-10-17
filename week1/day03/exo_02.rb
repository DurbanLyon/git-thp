puts "Please type your first name"
print "> "
first_name = gets.chomp

def hello(string)
    puts "Hello #{string}!"
end

hello(first_name)