require 'awesome_print'

class Game
    def initialize(id, mode)
        @array = Map.new(id, mode)
        test_array = [['X', 'O', 'O'], ['O', 'X', 'O'], ['X', 'O', 'X']]
        win = is_win?(test_array)
        print "lol" if win == true
    end

    def is_win?(array)
        return true if array[0][0] == 'X' && array[1][0] == 'X' && array[2][0] == 'X'
        return true if array[0][0] == 'O' && array[1][0] == 'O' && array[2][0] == 'O'

        return true if array[0][1] == 'X' && array[1][1] == 'X' && array[2][1] == 'X'
        return true if array[0][1] == 'O' && array[1][1] == 'O' && array[2][1] == 'O'

        return true if array[0][2] == 'X' && array[1][2] == 'X' && array[2][2] == 'X'
        return true if array[0][2] == 'O' && array[1][2] == 'O' && array[2][2] == 'O'

        return true if array[0][0] == 'X' && array[1][1] == 'X' && array[2][2] == 'X'
        return true if array[0][0] == 'O' && array[1][1] == 'O' && array[2][2] == 'O'

        return true if array[0][2] == 'X' && array[1][1] == 'X' && array[2][0] == 'X'
        return true if array[0][2] == 'O' && array[1][1] == 'O' && array[2][0] == 'O'

        return true if array[0][0] == 'X' && array[0][1] == 'X' && array[0][2] == 'X'
        return true if array[0][0] == 'O' && array[0][1] == 'O' && array[0][2] == 'O'

        return true if array[1][0] == 'X' && array[1][1] == 'X' && array[1][2] == 'X'
        return true if array[1][0] == 'O' && array[1][1] == 'O' && array[1][2] == 'O'
        
        return true if array[2][0] == 'X' && array[2][1] == 'X' && array[2][2] == 'X'
        return true if array[2][0] == 'O' && array[2][1] == 'O' && array[2][2] == 'O'
    end
end

class Map
    attr_accessor :map

    def initialize(id, mode)
        i = 1
        while i <= id
            @map = Array.new(id) { Array.new(id) { | index | index.to_s } }
            i += 1
        end
        manage_map(@map, mode, id)
    end

    def manage_map(map, mode, id)
        if mode == "dev"
            dev_output_map(map)
            player_output_map(map, id)
            print "\n"
        elsif mode == "player"
            test_array = [['X', 'O', 'O'], ['O', 'X', 'O'], ['X', 'O', 'X']]
            player_output_map(test_array, id)
            print "\n"
        end
    end
    
    def dev_output_map(map)
        print map { | index | index.to_s }
        print "\n"
    end

    def player_output_map(map, id)
        map.each do | index |
            print "\n  ===    ===    ===\n".blue
            index.each do | elem |
                elem = '-' if elem >= '0' && elem < id.to_s
                print ' | '.blue + elem.red + ' | '.blue
            end
            print "\n  ===    ===    ===\n".blue
        end
    end
end

class Launcher
    def initialize()
        start_in_progress()
    end

    def rules()
        puts 'Tic Tac Toe Game'
        print "\n"
        puts 'The rules are simple :'
        puts '  - Type the case position, turn by turn'
        puts '  - This will print the asset attributed'
        puts '  - You win if you make a line of your asset'
        print "\n"
    end

    def init_player()
        puts 'Please type a name for Player 1'
        puts '  - You will be assigned to' + ' O'.purple
        print '> '
        @p1_name = gets.chomp
        puts "----------------------> Welcome #{@p1_name.purple}"
        print "\n"
        puts 'Please type a name for Player 2'
        puts '  - You will be assigned to' + ' X'.greenish
        print '> '
        @p2_name = gets.chomp
        puts "----------------------> Welcome #{@p2_name.green}"
    end

    def play()
        puts 'TIC TAC TOE START !'.green
        print "\n"

        print "\n"
        puts 'TIC TAC TOE END !'.red
        print "\n"
    end

    def play_again?()
        puts "Do you want to play again ? (y/n)"
        print "> "
        id = gets.chomp.downcase
        if id == "y"
            print "\n"
            initialize()
        else
            puts "Exit"
            exit
        end
    end

    def start()
        rules()
        init_player()
        play()
        play_again?()
    end

    def start_in_progress()
        Game.new(3, "player")
    end
end

Launcher.new