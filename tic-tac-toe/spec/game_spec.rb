require_relative '../game.rb'

describe Player do
    before :all do
        @player = Player.new('Player', 'X')
    end
    
    it "holds a player's name" do
        expect(@player.name).to eq('Player')
    end
    
    it "holds a player's symbol" do
        expect(@player.symbol).to eq('X')
    end
end

describe Game do
    before :each do
        @game = Game.new
    end

    it "should create an empty board and set turns counter" do
        expect(@game.instance_variable_get(:@moves)).to eq([" "," "," "," "," "," "," "," "," "])
        expect(@game.instance_variable_get(:@turns)).to eq(1)
    end
end