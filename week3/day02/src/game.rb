require_relative 'board'
require_relative 'player'
require 'awesome_print'

class Game
    attr_reader :board, :p1, :p2

    def self.start
        new.start
    end    

    def initialize()
        @board = Board.new
    end

    def rules()
        puts 'This Program allow you to play the Tic Tac Toe Game'
        print "\n"
        puts 'The rules are simple :'
        puts '  - Type the case position, turn by turn'
        puts '  - This will print the asset attributed'
        puts '  - You win if you make a line of your asset'
        print "\n"
    end

    def start()
        rules()
        puts 'Please type a name for Player 1'
        puts '  - You will be assigned to' + ' O'.purple
        print '> '
        @p1_name = gets.chomp
        puts "Welcome #{@p1_name.purple}"
        print "\n"
        puts 'Please type a name for Player 2'
        puts '  - You will be assigned to' + ' X'.blue
        print '> '
        @p2_name = gets.chomp
        puts "Welcome #{@p2_name.blue}"
        print "\n"
        @p1 = Player.new('O'.purple)
        @p2 = Player.new('X'.blue)

        play()
        print "\n"
        puts 'TIC TAC TOE END !'.red
        print "\n"
        puts "Do you want to play again ? (y/n)"
        print "> "
        id = gets.chomp.downcase
        if id == "y"
            print "\n"
            initialize()
            start()
        else
            puts "Exit"
            exit
        end
    end

    def play()
        puts 'TIC TAC TOE START !'.green
        print "\n"
        board.print_current_board_state()
        print "\n"
        until board.end_game?() || board.can_add?()
            puts "Please, #{@p1_name.purple}, its your turn"
            p1.choose_pos(board)
            board.print_current_board_state()
            puts "Please, #{@p2_name.blue}, its your turn" if !board.end_game?() && !board.can_add?()
            p2.choose_pos(board) if !board.end_game?() && !board.can_add?()
            board.print_current_board_state()
        end
    end
end