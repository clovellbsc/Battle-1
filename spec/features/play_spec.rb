feature 'Play test' do
  scenario 'shows player 1 hp' do
    sign_in_and_play
    
    expect(page).to have_content "Charlotte's HP: 40"
  end

  scenario 'shows player 2 hp' do
    sign_in_and_play

    expect(page).to have_content "Mittens's HP: 40"
  end

  scenario 'attacking opponent returns confirmation' do
    sign_in_and_play
    click_button "attack"

    expect(page).to have_content "Charlotte attacked Mittens"
  end

  scenario "attacking reduces player 2's HP by 10" do
    sign_in_and_play
    click_button "attack"

    expect(page).to have_content "Mittens's HP: 30"
  end
end