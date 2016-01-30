require 'spec_helper'


describe 'Disks' do

  # Before each test
  # we will visit
  # the root URL of the game
  before do
    visit '/'
  end

  # ----------------------------------------
  # Winning
  # ----------------------------------------

  describe 'win detection' do

    it 'displays success message when winning moves are made' do
      win_game
      expect(page).to have_content('You win')
    end


    it 'does not display success message unless won' do
      make_move(1, 3)
      expect(page).to_not have_content('You win')
    end


    it 'resets the game state on the next request' do
      win_game
      visit '/'
      expect(page).to have_css('.tower-1 .disk-1')
      expect(page).to have_css('.tower-1 .disk-2')
      expect(page).to have_css('.tower-1 .disk-3')
    end
  end
end
