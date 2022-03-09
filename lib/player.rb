class Player
  def initialize(name, hp=40)
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