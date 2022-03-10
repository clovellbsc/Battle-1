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

	it "attack reduces player 2's HP when player 1's turn" do
    expect{game.attack}.to change{chris.hp}.from(Player::DEFAULT_HP).to(30)
	end

  it "attack reduces player 1's health when player 2 attacks" do
    game.attack
    expect{game.attack}.to change{felix.hp}.from(Player::DEFAULT_HP).to(30)
  end

  it 'receives damage when attacked' do
		expect(chris).to receive(:receive_damage)
		game.attack
	end

  it "upon initialisation, it should be player 1's turn" do
    expect(game.turn).to eq felix
  end

  it "after player 1's turn, it is now player 2's turn" do
    game.attack
    expect(game.turn).to eq chris
  end
end
