require_relative "card"
require "byebug"

class Board
    attr_reader :grid
    
    def initialize
        @grid = Array.new(4){Array.new(4, "_")}
    end

    def [](position)
        row,col = position
        @grid[row][col]
    end

    def []=(position, card)
        row, col = position
        @grid[row][col] = card
    end

    def populate
        card_values = []
        
        i = 0
        while i < 8
            letter = ("A".."Z").to_a.sample

            if !card_values.include?(letter)
                card_values << letter
                i += 1
            end
        end

        cards = []

        card_values.each do |ele|
            cards << Card.new(ele)
        end

        card_values.each do |ele|
            cards << Card.new(ele)
        end

        shuffled = cards.shuffle
        
        
        (0...@grid.length).each do |idx|
            @grid.each_with_index do |row, idx_2|
                @grid[idx][idx_2] = shuffled.pop
            end
        end

        @grid
    end

    def self.render
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def won? 
        @grid.all? do |row|
            row.any? { |ele| ele.up_down == false}
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos

        card = @grid[row][col]

        if !card.up_down
            card.reveal
            return card.face_value
        end
    end
end
