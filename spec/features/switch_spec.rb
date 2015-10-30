require 'spec_helper'

feature 'Switching' do
  scenario 'switchs turns' do
    sign_in_and_play
    attack_round
    click_button('Attack')
    expect(page).to have_content 'Incredible Yev attacks Almighty Tom!'
  end
end