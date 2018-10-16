class Player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def choose_pos(board)
        pos = get_pos(board)
        board.choose_pos(pos, mark)
    end

    def get_pos(board)
        puts "  - Please type a position between 0 and 8"
        print "> "
        pos = gets.chomp
        pos = pos.to_i if from_zero_to_eight?(pos)
        print "\n"

        while !pos.is_a?(Integer) || board.chosen_pos?(pos)
            print "\n"
            puts "You entered #{pos}, please retry !"
            puts "  - Please type a position between 0 and 8"
            print "> "
            pos = gets.chomp
            pos = pos.to_i if from_zero_to_eight?(pos)
            print "\n"
        end
        return pos
    end

    private

    def from_zero_to_eight?(pos)
        pos == '0' ||
        pos == '1' ||
        pos == '2' ||
        pos == '3' ||
        pos == '4' ||
        pos == '5' ||
        pos == '6' ||
        pos == '7' ||
        pos == '8'
    end
end