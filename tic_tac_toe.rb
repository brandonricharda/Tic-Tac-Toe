class Game
    
    def initialize
        @board = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9}
        @board_display = {1 => ["*", "*", "*"], 2 => ["*", "*", "*"], 3 => ["*", "*", "*"]}
        @board_template = {1 => ["1", "2", "3"], 2 => ["4", "5", "6"], 3 => ["7", "8", "9"]}
        puts "Player one, please enter your desired name. You will be X in this match."
        @player_one = gets.chomp
        @player_one_moves = 0
        puts "Player two, please enter your desired name. You will be O in this match."
        @player_two = gets.chomp
        @player_two_moves = 0
    end

    def startGame
        runs = 0
        until checkWinner
            if runs == 0
                boardTemplateDisplay
                runs += 1
            end
            playerOneMove
            boardDisplay
            next if checkWinner
            playerTwoMove
            boardDisplay
        end
        winner = @player_one_moves > @player_two_moves ? @player_one : @player_two
        puts "#{winner} has won the game!"
    end

    def boardDisplay
        puts ""
        puts @board_display[1].join("|")
        puts @board_display[2].join("|")
        puts @board_display[3].join("|")
        puts ""
    end

    def boardTemplateDisplay
        puts ""
        puts @board_template[1].join("|")
        puts @board_template[2].join("|")
        puts @board_template[3].join("|")
        puts ""
    end

    def updateDisplay(input, character)
        if input <= 3
            @board_display[1][input - 1] = character
        elsif input > 3 && input < 7
            @board_display[2][input - 4] = character
        elsif input > 6 && input < 10
            @board_display[3][input - 7] = character
        end
    end

    def horizontalCheck
        first_row = [@board[1], @board[2], @board[3]]
        second_row = [@board[4], @board[5], @board[6]]
        third_row = [@board[7], @board[8], @board[9]]
        first_row.uniq.size == 1 || second_row.uniq.size == 1 || third_row.uniq.size == 1
    end

    def verticalCheck
        first_col = [@board[1], @board[4], @board[7]]
        second_col = [@board[2], @board[5], @board[8]]
        third_col = [@board[3], @board[6], @board[9]]
        first_col.uniq.size == 1 || second_col.uniq.size == 1 || third_col.uniq.size == 1
    end

    def diagonalCheck
        first_cross = [@board[1], @board[5], @board[9]]
        second_cross = [@board[3], @board[5], @board[7]]
        first_cross.uniq.size == 1 || second_cross.uniq.size == 1
    end

    def checkWinner
        horizontalCheck || verticalCheck || diagonalCheck
    end

    def checkInput(input, player)
        result = input.to_i.between?(1, 9) && @board[input.to_i].is_a?(Integer) ? true : false
        if !result
            requestRetry(player)
        else
            input.to_i
        end
    end

    def requestRetry(player)
        puts "#{player}, please enter a digit between 1 and 9 to select a square that has not already been used."
        new_input = gets.chomp
        checkInput(new_input, player)
    end

    def playerOneMove
        puts "#{@player_one}, make your move. Enter a digit between 1 and 9 to represent what square you'd like. Think of the board like a telephone numpad."
        player_one_move = gets.chomp
        accepted_move = checkInput(player_one_move, @player_one)
        @board[accepted_move] = "X"
        updateDisplay(accepted_move, "X")
        @player_one_moves += 1
    end

    def playerTwoMove
        puts "#{@player_two}, make your move. Enter a digit between 1 and 9 to represent what square you'd like. Think of the board like a telephone numpad."
        player_two_move = gets.chomp
        accepted_move = checkInput(player_two_move, @player_two)
        @board[accepted_move] = "O"
        updateDisplay(accepted_move, "O")
        @player_two_moves += 1
    end

end

test = Game.new

test.startGame