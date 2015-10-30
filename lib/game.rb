require_relative 'damage'

class Game

  attr_reader :current_turn, :attack_message

  def initialize(player_1, player_2, damage_model=Damage)
    @players = [player_1, player_2]
    @current_turn = player_1
    @damage = damage_model
    @attack_message = ''
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage(@damage.random)
    @attack_message = "#{@current_turn.name} attacks #{player.name}!"
    switch
  end

  def heal(player)
    player.heal(@damage.random)
    @attack_message = "#{player.name} is healed!"
    switch
  end

  def sleep(player)
    if @damage.sleep
      @attack_message = "#{player.name} is sleeping!"
    else
      @attack_message = "Unlucky #{player.name} is still awake!"
       switch
    end
  end

  def opposite_player
    @players.select { |elem| elem != @current_turn }.first
  end

  def losing_player
    @players.select { |elem| elem.lost? }.first
  end

  def winning_player
    @players.select { |elem| elem.lost? == false }.first
  end

  def game_over?
    !losing_player.nil?
  end

  private

  def switch
    @current_turn = opposite_player
  end
end