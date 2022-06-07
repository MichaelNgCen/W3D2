require_relative "card"
require_relative "board"

attr_reader :board, :previous_guess

class Game
    def initialize
        @board = Board.new
        @previous_guess = []
    end

    def make_guess(move)
        row, col = move
        previous_guess = @grid[move]
        @grid[move].reveal
    end

    def play
        while !won?

        end 
    end
end