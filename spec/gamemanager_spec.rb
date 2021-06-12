require_relative '../lib/gamemanager'

describe GameManager do
  let(:game) { GameManager.new('j', 'h') }

  describe '#check_valid_choice' do
    it 'returns false if the choice is less than one' do
      expect(game.check_valid_choice(0)).to eql false
      expect(game.check_valid_choice(6)).to eql true
    end
    it 'Does not allow movements if the position has been taken' do
      game.board[1] = 'X'
      game.board[2] = 'O'
      expect(game.check_valid_choice(1)).to eql false
      expect(game.check_valid_choice(3)).to eql true
    end
  end

  describe '#check_draw' do
    it 'should return false if there isn´t empty space' do
      expect(game.check_draw).to eql false
    end
    it 'should return true if all spaces are taken and there is no winner' do
      game.board[1] = 'x'
      game.board[2] = 'o'
      game.board[3] = 'x'
      game.board[4] = 'o'
      game.board[5] = 'x'
      game.board[6] = 'o'
      game.board[7] = 'x'
      game.board[8] = 'o'
      game.board[9] = 'x'
      expect(game.check_draw).to eql true
    end
  end

  describe '#check_win' do
    it 'should return false if no player won' do
      expect(game.check_win).to eql false
    end

    it 'should return true if player has won' do
      game.board[1] = 'x'
      game.board[2] = 'x'
      game.board[3] = 'x'
      expect(game.check_win).to eql true
    end
  end
end
