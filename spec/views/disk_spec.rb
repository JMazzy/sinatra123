require 'spec_helper'


describe 'Disks' do

  # Before each test
  # we will visit
  # the root URL of the game
  before do
    visit '/'
  end

  describe 'each disk element' do

    it 'has a disk class' do
      expect(page).to have_css('.disk', :count => 3)
    end


    it 'has an disk identifier class' do
      expect(page).to have_css('.disk-1', :count => 1)
      expect(page).to have_css('.disk-2', :count => 1)
      expect(page).to have_css('.disk-3', :count => 1)
    end


    it 'displays the disk size in the disk element' do
      disk_1 = find('.disk-1', :text => '1')
      disk_2 = find('.disk-2', :text => '2')
      disk_3 = find('.disk-3', :text => '3')
      expect(disk_1).to_not be_nil
      expect(disk_2).to_not be_nil
      expect(disk_3).to_not be_nil
    end
  end
end
