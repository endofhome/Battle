require 'spec_helper'

feature 'Game Over' do
  scenario 'It runs game over sequence when player lost' do
    sign_in_and_play
    allow(Damage).to receive(:random).and_return(Player::DEFAULT_HP)
    click_button('Attack')
    expect(page).to have_content 'Incredible Yev has lost!  Almighty Tom has won!'
  end
end