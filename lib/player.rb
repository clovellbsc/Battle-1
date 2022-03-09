class Player

  DEFAULT_HP = 40

  def initialize(name, hp= DEFAULT_HP)
    @name = name
    @hp = hp
  end
  
  attr_reader :name, :hp

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @hp -= 10
  end
end