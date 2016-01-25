require 'spec_helper'

describe 'Towers' do

  # Before each test
  # we will visit
  # the root URL of the game
  before do
    visit '/'
  end

  describe 'each tower' do

    it 'has a tower class' do
      expect(page).to have_css('.tower', :count => 3)
    end

    # Make sure to check out the comments in views/tower.erb!!!

    it 'has a tower identifier class' do
      expect(page).to have_css('.tower-1', :count => 1)
      expect(page).to have_css('.tower-2', :count => 1)
      expect(page).to have_css('.tower-3', :count => 1)
    end


    it 'displays the tower number in the tower number element' do
      tower_number_1 = find('.tower-1 .tower-number', :text => '1')
      tower_number_2 = find('.tower-2 .tower-number', :text => '2')
      tower_number_3 = find('.tower-3 .tower-number', :text => '3')
      expect(tower_number_1).to_not be_nil
      expect(tower_number_2).to_not be_nil
      expect(tower_number_3).to_not be_nil
    end
  end
end
