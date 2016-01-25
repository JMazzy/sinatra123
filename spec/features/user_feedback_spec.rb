require 'spec_helper'


describe 'User Feedback' do

  # Before each test
  # we will visit
  # the root URL of the game
  before do
    visit '/'
  end

  # ----------------------------------------
  # User Feedback Messages
  # ----------------------------------------

  describe 'displaying an error messages' do

    it 'occurs when moves from an empty tower' do
      make_move(3, 1)
      expect(page).to have_content('Invalid move')
    end


    it 'occurs when moves to same tower' do
      make_move(1, 1)
      expect(page).to have_content('Invalid move')
    end


    it 'occurs when attempts to move larger disk on smaller disk' do
      make_move(1, 3)
      make_move(1, 3)
      expect(page).to have_content('Invalid move')
    end

    it 'does not occur when moves are valid' do
      make_move(1, 3)
      expect(page).to_not have_content('Invalid move')
    end
  end
end
