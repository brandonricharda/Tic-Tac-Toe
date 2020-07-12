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

    def start_game
        
        until check_winner || full?
            display_board
            p "The board works like the first three rows of a telephone numpad. Please choose an empty (nil) spot."
            player_move
            computer_move
        end

        if check_winner
            p "#{check_winner} has won!"
        elsif fill?
            p "It's a draw!"
        end

    end

    def player_move(spot = nil)

        spot = spot.to_i

        until empty?(spot) && (1..9).include?(spot.to_i)
            if !empty?(spot)
                p "That spot is taken. Please choose another."
            elsif !(1..9).include?(spot.to_i)
                p "Enter a number from 1-9."
            end
            spot = gets.chomp.to_i
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

    def full?
        return false if check_winner
        @board.positions.none? { |key, value| !value } ? true : false
    end

    def check_winner
        moves = @board.positions.select { |key, value| value == "X" || value == "O" }
        player_pos = moves.select { |key, value| value == "X" }
        computer_pos = moves.select { |key, value| value == "O" }
        return false unless @winning_moves.any? { |move| move == player_pos.keys || move == computer_pos.keys }
        @winning_moves.any? { |move| move == player_pos.keys } ? @player : @computer
    end

    def display_board
        positions = @board.positions.values
        top, middle, bottom = Array.new(3) { [] }
        positions.each_with_index do |square, index|
            top << square if (0..2).include?(index)
            middle << square if (3..5).include?(index)
            bottom << square if (6..8).include?(index)
        end
        p top
        p middle
        p bottom
    end

end