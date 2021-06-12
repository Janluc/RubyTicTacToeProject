require_relative '../lib/player'

describe Player do
  let(:player) { Player.new('John', 'x') }
  describe '#initialize' do
    it 'should return a name of player' do
      expect(player.name).to eql('John')
      expect(player.name).not_to eql('Pete')
    end

    it 'return a token of the player' do
      expect(player.token).to eql('x')
      expect(player.token).not_to eql('o')
    end
  end
end
