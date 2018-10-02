def dice()
    i = 1 + rand(6)
    return i
end

def reroll(tmp)
    tmp = dice()
    return tmp
end

def display(value)
    tmp = Array.new(10, " ")
    i = 0
    while i <= value
        if i == value
            tmp[i] = "X"
        end
        i += 1
    end
    return tmp
end

def game(roll)
    i = 0
    total_stage = 10
    roll = 0
    while roll && i <= total_stage
        roll = reroll(roll)
        if roll == 1
            if i == 0
                i = 0
                print "[ #{roll} ][ \033[0;31mERROR\033[0;0m  ]  [ #{display(i - 1)} ]  [ \033[0;31m- YOU ARE NOW ON STAGE #{i}\033[0;0m  ]"
                print "\n"
                roll = reroll(roll)
            else
                i -= 1
                print "[ #{roll} ][ \033[0;31mLOOSE\033[0;0m  ]  [ #{display(i - 1)} ]  [ \033[0;31m- YOU ARE NOW ON STAGE #{i}\033[0;0m  ]"
                print "\n"
                roll = reroll(roll)
            end
        end
        if roll == 2 || roll == 3 || roll == 4
            print "[ #{roll} ][ REROLL ]  [ #{display(i - 1)} ]  [ o DICE ARE ROLLED         ]"
            print "\n"
            roll = reroll(roll)
        end
        if roll == 5 || roll == 6
            if i == 10
                print "\n"
                print "[ #{roll} ][ \033[0;32mWIN\033[0;0m    ]  [ #{display(i - 1)} ]  [ o CONGRATULATIONS YOU WIN ]"
                print "\n"
                exit
            else
                print "[ #{roll} ][ \033[0;32mWIN\033[0;0m    ]  [ #{display(i - 1)} ]  [ \033[0;32m+ YOU ARE NOW ON STAGE #{i}\033[0;0m  ]"
                print "\n"
                i += 1
                roll = reroll(roll)
            end
        end
    end
end

def launcher()
    puts "  Welcome to The Game"
    puts "  The objective is to reach the last stage"
    puts "  The Game launch at stage 0, there is 10 stage to reach"
    puts "  When you start a game, dice are rolled"
    puts "  They will be while they dont reach the last stage"
    puts "  You need two win for get point and need to loose for lose point"
    puts "  Rules are very simple :"
    print "\n"
    puts "  [1] - Go to the last box, if 0 stay at 0"
    puts "  [2, 3, 4] - Dice are rolled again"
    puts "  [5, 6] - Go to the next box, if 10 you win"
    print "\n"

    roll = dice()
    game(roll)
end

launcher()