require_relative "board.rb"

class Game

    attr_accessor :player, :board

    def initialize
        @player = "X"
        @computer = "O"
        @board = Board.new
        @winning_moves = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
            [1, 4, 7],
            [2, 5, 8],
            [3, 6, 9],
            [1, 5, 9],
            [3, 5, 7]
        ]
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
        !@board.positions[spot] ? true : false
    end

    def check_winner
        moves = @board.positions.select { |key, value| value == "X" || value == "O" }
        player_pos = moves.select { |key, value| value == "X" }
        computer_pos = moves.select { |key, value| value == "O" }
        return false unless @winning_moves.any? { |move| move == player_pos.keys || move == computer_pos.keys }
        @winning_moves.any? { |move| move == player_pos.keys } ? @player : @computer
    end

    def full?
        return false if check_winner
        @board.positions.none? { |key, value| !value } ? true : false
    end

end