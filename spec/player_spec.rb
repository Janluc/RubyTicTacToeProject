require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    it 'should return a name of player' do
      player = Player.new('John', 'x')
      expect(player.name).to eql('John')
      expect(player.name).not_to eql('Pete')
    end

    it 'return a token of the player' do
      player = Player.new('John', 'o')
      expect(player.token).to eql('o')
      expect(player.token).not_to eql('x')
    end
  end
end
