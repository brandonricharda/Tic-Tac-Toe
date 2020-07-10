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

    def check_winner
        moves = @board.positions.select { |key, value| value == "X" || value == "O" }
        player_count = moves.values.count("X")
        computer_count = moves.values.count("O")
        return false if player_count < 3 && computer_count < 3
        player_count > computer_count ? @player : @computer
    end

end

test = Game.new
test.player_move(1)
test.player_move(3)
test.player_move(9)
p test.check_winner