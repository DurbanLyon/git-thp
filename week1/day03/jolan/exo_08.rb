def dice()
    i = 1 + rand(6)
    return i
end

def reroll(tmp)
    tmp = dice()
    return tmp
end

def win()
    puts "GAME WIN -        Congratulations !"
end

def game(tmp)
    i = 0
    total_stage = 10
    while tmp && i <= total_stage
        if tmp == 1
            if i == 0
                i = 0
                puts "ERROR -           You are already at [STAGE #{i}]"
                tmp = reroll(tmp)
            else
                i -= 1
                puts "LOOSE -           You are now on [STAGE #{i - 1}]"
                tmp = reroll(tmp)
            end
        end
        if tmp == 2 || tmp == 3 || tmp == 4
            puts "TRY AGAIN -       Dice are rolled"
            tmp = reroll(tmp)
        end
        if tmp == 5 || tmp == 6
            if i == 10
                puts "WIN -             You are now on [STAGE #{i}]"
                win()
                exit
            else
                puts "WIN -             You are now on [STAGE #{i}]"
                i += 1
                tmp = reroll(tmp)
            end
        end
    end
end

def launcher()
    puts "Welcome to The Game"
    puts "The objective is to reach the last stage"
    puts "The Game launch at stage 0, there is 10 stage to reach"
    puts "When you start a game, dice are rolled"
    puts "They will be while they dont reach the last stage"
    puts "Rules are very simple :"
    print "\n"
    puts "  [1] - Go to the last box, if 0 stay at 0"
    puts "  [2, 3, 4] - Dice are rolled again"
    puts "  [5, 6] - Go to the next box, if 10 you win"
    print "\n"
    game(dice())
end

launcher()