require_relative '../lib/gamemanager'

describe GameManager do
    
    describe "#check_valid_choice" do
    it 'returns false if the choice is less than one' do
        game =  GameManager.new("j", "h")
        expect(game.check_valid_choice(0)).to eql false
        expect(game.check_valid_choice(6)).to eql true
    end
    it 'Does not allow movements if the position has been taken' do
        game =  GameManager.new("j", "h")
        game.board[1] = "X"
        game.board[2] = "O"
        expect(game.check_valid_choice(1)).to eql false
        expect(game.check_valid_choice(3)).to eql true
    end
end

describe "#check_valid_choice" do
it 'should return false if there isn´t empty space' do
game =  GameManager.new("j", "h")
expect(game.check_draw).to eql false
end
end
end