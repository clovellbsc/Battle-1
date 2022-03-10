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


end