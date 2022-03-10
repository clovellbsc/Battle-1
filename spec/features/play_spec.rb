feature 'Play test' do
  scenario 'shows player 1 hp' do
    sign_in_and_play
    
    expect(page).to have_content "Charlotte's HP: 40"
  end

  scenario 'shows player 2 hp' do
    sign_in_and_play

    expect(page).to have_content "Mittens's HP: 40"
  end

  scenario 'attacking player 2 returns confirmation' do
    sign_in_and_play
    click_button "attack"

    expect(page).to have_content "Charlotte attacked Mittens"
  end

  scenario "attacking player 1 returns confirmation" do
    sign_in_and_play
    click_button "attack"
    click_button "Mittens's turn"
    click_button "attack"

    expect(page).to have_content "Mittens attacked Charlotte"
  end

  scenario "attacking reduces player 2's HP by 10" do
    sign_in_and_play
    click_button "attack"

    expect(page).to have_content "Mittens's HP: 30"
  end

  scenario "after attacking, you can click next turn" do
    sign_in_and_play
    click_button "attack"

    expect(page).to have_button("Mittens's turn")
  end

  scenario "after clicking next turn, it brings us back to play page" do
    sign_in_and_play
    click_button "attack"
    click_button "Mittens's turn"

    expect(page).to have_content("Charlotte vs. Mittens")
  end

  scenario "after attacking again it displays button saying player 2's turn" do
    sign_in_and_play
    click_button "attack"
    click_button "Mittens's turn"
    click_button "attack"

    expect(page).to have_button("Charlotte's turn")
  end

end