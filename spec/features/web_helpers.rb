def sign_in_and_play
  visit('/')
    fill_in :player_1_name, with: 'Charlotte'
    fill_in :player_2_name, with: 'Mittens'
    click_button 'Submit'
end

def one_turn_cycle
  click_button "attack"
  click_button "Mittens's turn"
  click_button "attack"
  click_button "Charlotte's turn"
end