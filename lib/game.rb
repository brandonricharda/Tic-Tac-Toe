require_relative "board.rb"

class Game

    attr_accessor :player, :board

    def initialize
        @player = "X"
        @board = Board.new
    end

    def player_move(spot = nil)
        
        if !spot
            p "Please choose a position."
            spot = gets.chomp
        end

        until spot.to_i != 0
            p "Please choose a number from 1-9."
            spot = gets.chomp
        end

        @board.positions[spot] = @player
        @board.positions[spot]

    end

end

test = Game.new
test.player_move(1)