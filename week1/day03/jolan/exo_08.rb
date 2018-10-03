def dice()
    i = 1 + rand(6)
    return i
end

def reroll(roll)
    roll = dice()
    return roll
end

def display(value)
    tmp = Array.new(11, " ")
    i = 0
    while i <= value
        if i == value
            tmp[i] = "X"
        end
        i += 1
    end
    return tmp
end

def putvalue(roll, rule)
    i = 1
    total_stage = 10
    while roll && i <= total_stage
        roll = reroll(roll)
        if roll == 1
            if i == 1
                print "[ #{roll} ]"
                print "[ \033[0;31mLOOSE\033[0;0m  ]   "
                print "#{display(i - 1)}   "
                print "[ \033[0;31m- YOU ARE NOW ON STAGE #{i - 1}\033[0;0m  ]"
                print "\n"
                roll = reroll(roll)
            else
                i -= 1
                print "[ #{roll} ]"
                print "[ \033[0;31mLOOSE\033[0;0m  ]   "
                print "#{display(i - 1)}   "
                print "[ \033[0;31m- YOU ARE NOW ON STAGE #{i - 1}\033[0;0m  ]"
                print "\n"
                roll = reroll(roll)
            end
        end
        if roll == 2 || roll == 3 || roll == 4
            if rule == 1
                print "[ #{roll} ]"
                print "[ REROLL ]   "
                print "#{display(i * -i)}   "
                print"[ o DICE ARE ROLLED         ]"
                print "\n"
                roll = reroll(roll)
            end
            if rule == 0
                roll = reroll(roll)
            end
        end
        if roll == 5 || roll == 6
            if i == 10
                print "[ #{roll} ]"
                print "[ \033[0;32mFINISH\033[0;0m ]   "
                print "#{display(i)}   "
                print "[ \033[0;32mo CONGRATULATIONS YOU WIN\033[0;0m ]"
                print "\n"
                exit
            else
                print "[ #{roll} ]"
                print "[ \033[0;32mWIN\033[0;0m    ]   "
                print "#{display(i)}   "
                print "[ \033[0;32m+ YOU ARE NOW ON STAGE #{i}\033[0;0m  ]"
                print "\n"
                i += 1
                roll = reroll(roll)
            end
        end
    end
end

def game()
    print "\n"
    puts "Please type (1) to unshow reroll (0) to hide reroll"
    print "> "
    rule = gets.chomp.to_i
    print "\n"
    roll = 0
    if roll == 0
        i = 0
        print "[ #{roll} ]"
        print "[ \033[0;32mSTART\033[0;0m  ]   "
        print "#{display(i)}   "
        print "[ o GAME STARTING HERE      ]"
        print "\n"
    end
    roll = reroll(roll)
    putvalue(roll, rule)
end

def launcher()
    puts "  Welcome to The Game"
    puts "  The objective is to reach the last stage"
    puts "  The Game launch at stage 0, there is 10 stage to reach"
    puts "  When you start a game, dice are rolled"
    puts "  They will be while they dont reach the last stage"
    puts "  Rules are very simple :"
    print "\n"
    puts "  [1] - Go to the previous box, if 0 stay at 0"
    puts "  [2, 3, 4] - Dice are rolled again"
    puts "  [5, 6] - Go to the next box, if 10 you win"
    print "\n"

    game()
end

launcher()
