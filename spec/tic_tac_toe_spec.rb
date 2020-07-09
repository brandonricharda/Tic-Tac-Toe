require "./lib/board.rb"
require "./lib/game.rb"

describe Board do

    it "produces a board with nine spaces" do
        test = Board.new
        expect(test.positions.keys.length).to eql(9)
    end

    it "produces an empty board" do
        test = Board.new
        expect(test.positions.values.all? { |value| !value } ).to eql(true)
    end

end

describe Game do

    it "assigns correct symbol to player" do
        test = Game.new
        expect(test.player).to eql("X")
    end

    it "creates board using correct class" do
        test = Game.new
        expect(test.board.class).to eql(Board)
    end

    describe "#empty?" do

        it "identifies when a square already has a move placed in it" do
            test = Game.new
            test.player_move(1)
            expect(test.empty?(1)).to eql(false)
        end

        it "identifies when a square is empty" do
            test = Game.new
            expect(test.empty?(1)).to eql(true)
        end

    end

    describe "#computer_move" do
        it "sets the computer's move" do
            test = Game.new
            expect(test.computer_move).to eql("O")
        end
    end

    describe "#player_move" do

        it "sets the player's move correctly" do
            test = Game.new
            expect(test.player_move(1)).to eql("X")
        end

        it "accepts user input about position and sets it correctly" do
            test = Game.new
            expect(test.player_move).to eql("X")
        end

        it "gets user to correct input if it is not an integer" do
            test = Game.new
            expect(test.player_move("A")).to eql("X")
        end

        it "gets user to correct input if the square is taken" do
            test = Game.new
            test.computer_move
            computer_spot = test.board.positions.select { |key, value| value }.keys[0]
            test.player_move(computer_spot)
            expect(test.board.positions[computer_spot]).to eql("O")
        end

    end

end