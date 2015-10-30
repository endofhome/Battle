require 'player'

describe Player do
  subject(:player_1) { described_class.new(player_1_name)}
	let(:player_1_name) {"Yev"}
  subject(:player_2) { described_class.new(player_2_name)}
  let(:player_2_name) {"Andy"}

	describe '#initialize' do
		it {is_expected.to respond_to(:name)}
  end

  describe '#hp' do
    it 'is expected to have default hit points' do
      expect(player_1.hp).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it 'should reduce the players hp by the amount specified' do
      expect{ player_1.receive_damage(10) }.to change{ player_1.hp }.by -10
    end
  end

  describe '#lost?' do
    it 'returns true when @hp is 0 or less' do
      player_1.receive_damage(described_class::DEFAULT_HP)
      expect(player_1.lost?).to eq true
    end
    it 'returns false when @hp is above 0' do
      expect(player_1.lost?).to eq false
    end
  end

  describe '#heal' do
    it 'heals the player' do
      expect{ player_1.heal(10) }.to change{ player_1.hp }.by 10
    end
  end
end










