require 'spec_helper'

feature 'Hit points' do
  scenario 'displays both players hit points' do
    sign_in_and_play
    expect(page).to have_content 'Incredible Yev: 100HP'
    expect(page).to have_content 'Almighty Tom: 100HP'
  end

  scenario 'reduces both players hit points after being attacked' do
    allow(Damage).to receive(:random).and_return(10)
    sign_in_and_play
    attack_round
    expect(page).to have_content 'Incredible Yev: 90HP'
    attack_round
    expect(page).to have_content 'Almighty Tom: 90HP'
  end

end