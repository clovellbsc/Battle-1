require 'player'

describe Player do

	subject(:felix) {Player.new("Felix")}
	subject(:chris) {Player.new("Chris")}


  it "can return it's name" do
		expect(felix.name).to eq("Felix")
	end

	it 'can return hp' do
		expect(felix.hp).to eq(Player::DEFAULT_HP)
	end

	it 'attack reduces other players HP i guess' do
    expect{felix.attack(chris)}.to change{chris.hp}.from(Player::DEFAULT_HP).to(30)
	end

	it 'receives damage when attacked' do
		expect(chris).to receive(:receive_damage)
		felix.attack(chris)
	end
end