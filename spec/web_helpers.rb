require 'spec_helper'

def sign_in_and_play
	visit('/')
	fill_in(:player_1, with: 'Almighty Tom')
  fill_in(:player_2, with: 'Incredible Yev')
  click_button 'Submit'
end

def attack_round
    click_button('Attack')
    click_button('OK')
end