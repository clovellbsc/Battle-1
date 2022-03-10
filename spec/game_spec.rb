require 'game'

describe Game do

  subject(:game) { Game.new }
  let(:felix) { Player.new("Felix") }
	let(:chris) { Player.new("Chris") }

	it 'attack reduces other players HP' do
    expect{game.attack(chris)}.to change{chris.hp}.from(Player::DEFAULT_HP).to(30)
	end

  it 'receives damage when attacked' do
		expect(chris).to receive(:receive_damage)
		game.attack(chris)
	end

end
