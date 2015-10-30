require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2, damage) }
  let(:player_1) { double :player_1, receive_damage: nil, lost?: false, name: 'Andy', heal: nil}
  let(:player_2) { double :player_2, receive_damage: nil, lost?: false, name: 'Rob', heal: nil}
  let(:damage) { double :damage, random: 20, sleep: true }

  subject(:losing_game) { described_class.new(player_1, player_lost, damage) }
  let(:player_lost) {double :losing_player, lost?: true }


  describe '#attack' do
    it 'should call the receive damage method' do
      expect(player_1).to receive(:receive_damage)
      game.attack(player_1)
    end

    it 'should switch turns after attacking' do
      expect{ game.attack(player_2) }.to change{ game.current_turn }.to(player_2)
    end
  end

  describe 'player instance variables' do
    it 'retrieves player_1' do
      expect(game.player_1).to eq player_1
    end
    it 'retrieves player_2' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#opposite_player' do
    it 'has an opposite player as player 2' do
      expect(game.opposite_player).to eq player_2
    end
  end

  describe '#attack' do
    it 'calls receive damage with 1 arg on player' do

      expect(player_2).to receive(:receive_damage).with(damage::random)
      game.attack(player_2)
    end
  end

  describe '#heal' do
    it 'should call the Player#heal method' do
      expect(player_1).to receive(:heal)
      game.heal(player_1)
    end

    it 'should switch turns after healing' do
      expect{ game.heal(player_1) }.to change{ game.current_turn }.to(player_2)
    end

    it 'should update the #attack_message' do
      expect{ game.heal(player_1) }.to change { game.attack_message }.to "Andy is healed!"
    end
  end

    describe '#sleep' do
    it 'should call the #damage.sleep method' do
      expect(damage).to receive(:sleep)
      game.sleep(player_1)
    end

    it 'should not switch turns when sleeping' do
      game.sleep(player_2)
      expect(game.current_turn).to eq(player_1)
    end

    it 'should update the #attack_message' do
      expect{ game.sleep(player_1) }.to change { game.attack_message }.to "Andy is sleeping!"
    end
  end

  describe '#losing_player' do
    it 'identifies a losing player' do
      expect(losing_game.losing_player).to eq player_lost
    end
  end

  describe '#winning_player' do
    it 'identifies a winning player' do
      expect(losing_game.winning_player).to eq player_1
    end
  end

  describe '#game_over?' do
    it 'identifies that it is game over when there is a losing player' do
      expect(losing_game.game_over?).to eq true
    end
  end

  describe '@attack_message' do
    it 'updates the attack message on attack' do
      game.attack(player_2)
      expect(game.attack_message).to eq 'Andy attacks Rob!'
    end

    it 'defaults as an empty message' do
      expect(game.attack_message).to eq ''
    end
  end
end








