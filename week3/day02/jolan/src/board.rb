class Board
    attr_reader :pos

    def initialize()
        @pos = [ '0', '1', '2', '3', '4', '5', '6', '7', '8' ]
    end

    def choose_pos(index, mark)
        pos[index] = mark
    end

    def game_over?
        [board_pos[0], board_pos[1], board_pos[2]].uniq.size == 1 ||
        [board_pos[3], board_pos[4], board_pos[5]].uniq.size == 1 ||
        [board_pos[6], board_pos[7], board_pos[8]].uniq.size == 1 ||
        [board_pos[0], board_pos[3], board_pos[6]].uniq.size == 1 ||
        [board_pos[1], board_pos[4], board_pos[7]].uniq.size == 1 ||
        [board_pos[2], board_pos[5], board_pos[8]].uniq.size == 1 ||
        [board_pos[0], board_pos[4], board_pos[8]].uniq.size == 1 ||
        [board_pos[2], board_pos[4], board_pos[6]].uniq.size == 1
    end

    def tie?
        board_pos.all? { | elem | elem == 'X' || elem == 'O' }
    end

    def chosen_pos?(pos)
        board_pos[pos] == 'X' || board_pos[pos] == 'O'
    end

    def not_chosen_pos?(pos)
        board_pos[pos] != 'X' && board_pos[pos] != 'O'
    end

    def print_current_board_state()
        puts " #{board_pos[0]} | #{board_pos[1]} | #{board_pos[2]}"
        puts "---+---+---"
        puts " #{board_pos[3]} | #{board_pos[4]} | #{board_pos[5]}"
        puts "---+---+---"
        puts " #{board_pos[6]} | #{board_pos[7]} | #{board_pos[8]}"
        print "\n"
    end

    private

    def board_pos()
        return pos
    end
end