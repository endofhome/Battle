require 'spec_helper'

feature 'Attacking' do
  scenario 'attacks player 2 and receives confirmation' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Almighty Tom attacks Incredible Yev!'
  end

  scenario 'heal' do
    sign_in_and_play
    click_button('Heal')
    expect(page).to have_content 'Almighty Tom is healed!'
  end

  scenario 'sleep' do
    sign_in_and_play
    click_button('Sleep')
    expect(page).to have_content 'Incredible Yev is sleeping!'
  end
end