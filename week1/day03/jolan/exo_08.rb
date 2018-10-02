
def check_player(value)
    if value != nil
        puts "Welcome #{value}\n\n"
    end
end

def get_player()
    puts "Please type Username for Player One"
    print "> "
    player_one = gets.chomp
    check_player(player_one)
    puts "Please type Username for Player Two"
    print "> "
    player_two = gets.chomp
    check_player(player_two)
end

def get_stage()
    puts "Please type an Integer Value for generate level stage"
    print "> "
    tmp = gets.chomp
    $tmp = tmp.to_i
    puts "Your value is #{$tmp}"
    stage($tmp)
end

def stage(value)
    i = 1
    if $tmp < 0 || $tmp > 25
        $tmp -= $tmp
        puts "Error"
    end
    while i <= $tmp
        j = $tmp - i
        stage = "  " * j + "##" * i
        puts "#{stage}"
        i += 1
    end
end

get_player()
get_stage()