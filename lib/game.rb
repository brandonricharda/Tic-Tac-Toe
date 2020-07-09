require_relative "board.rb"

class Game

    attr_accessor :player, :board

    def initialize
        @player = "X"
        @computer = "O"
        @board = Board.new
    end

    def player_move(spot = nil)

        until empty?(spot) && spot.to_i != 0

            if !empty?(spot)
                p "That spot is taken. Please choose another."
            elsif spot.to_i == 0
                p "Please choose a number from 1-9."
            end

            spot = gets.chomp

        end

        @board.positions[spot] = @player
        @board.positions[spot]

    end

    def computer_move

        spot = rand(1..9)

        until empty?(spot)
            spot = rand(1..9)
        end

        @board.positions[spot] = @computer
        @board.positions[spot]

    end

    def empty?(spot)

        result = !@board.positions[spot] ? true : false

    end

end

test = Game.new
test.computer_move
p test.board.positions.select { |key, value| value }.keys[0]