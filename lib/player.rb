class Player
	attr_reader :name, :hp

  DEFAULT_HP = 100

	def initialize(name)
		@name = name
    @hp = DEFAULT_HP
    @awake = true
	end

  def receive_damage(attack_dmg)
    @hp -= attack_dmg
  end

  def heal(heal_amount)
    @hp += heal_amount
  end

  def lost?
    @hp <= 0
  end
end