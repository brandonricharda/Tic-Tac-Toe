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

    end

end

