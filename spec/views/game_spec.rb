require 'spec_helper'


describe 'Game view' do

  # Before each test
  # we will visit
  # the root URL of the game
  before do
    visit '/'
  end

  # ----------------------------------------
  # Basic display
  # ----------------------------------------

  it 'displays the game' do
    expect(page).to have_content('Tower Of Hanoi')
  end

end
