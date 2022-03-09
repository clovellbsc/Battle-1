require 'player'

describe Player do
  it "can return it's name" do
		felix = Player.new("Felix")
		expect(felix.name).to eq("Felix")
	end
end