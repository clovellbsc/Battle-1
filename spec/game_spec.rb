require 'game'

describe Game do

  subject(:game) { Game.new(felix, chris) }
  let(:felix) { Player.new("Felix") }
	let(:chris) { Player.new("Chris") }

  it 'should expect player 1 to retrieve felix' do
    expect(game.player1.name).to eq "Felix"
  end

  it 'should expect player 2 to retrieve chris' do
    expect(game.player2.name).to eq "Chris"
  end

	it 'attack reduces other players HP' do
    expect{game.attack(chris)}.to change{chris.hp}.from(Player::DEFAULT_HP).to(30)
	end

  it 'receives damage when attacked' do
		expect(chris).to receive(:receive_damage)
		game.attack(chris)
	end

end
