feature 'Shows hp' do
  scenario 'shows player 1 hp' do
    visit('/')
    fill_in :player_1_name, with: 'Charlotte'
    fill_in :player_2_name, with: 'Mittens'
    click_button 'Submit'

    expect(page).to have_content "Charlotte's health: 40"
  end

  scenario 'shows player 2 hp' do
    visit('/')
    fill_in :player_1_name, with: 'Charlotte'
    fill_in :player_2_name, with: 'Mittens'
    click_button 'Submit'

    expect(page).to have_content "Mittens's health: 40"
  end
end