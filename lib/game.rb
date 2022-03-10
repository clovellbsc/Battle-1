require_relative 'player'

class Game

  attr_reader :player1, :player2

  def initialize(player1 = Player.new("Felix"), player2 = Player.new("Chris"))
    @player1 = player1
    @player2 = player2
    @counter = 1
  end
  
  def attack
    turn == @player1 ? @player2.receive_damage : @player1.receive_damage
    @counter += 1
  end

  def turn
    @counter.odd? ? @player1 : @player2
  end

  def opponent
    @counter.even? ? @player1 : @player2
  end

end
