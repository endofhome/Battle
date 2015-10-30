require 'damage'

describe Damage do

  subject(:damage_class) { described_class }

  describe '#random' do
    it 'returns a number > 0' do
      expect(damage_class.random).to be >0
    end
  end
end