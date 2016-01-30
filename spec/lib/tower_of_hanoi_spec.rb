require 'spec_helper'
require 'tower_of_hanoi'

describe TowerOfHanoi do

  let(:win_state) { [[], [], [1, 2, 3]] }
  let(:toh) { TowerOfHanoi.new }


  # ----------------------------------------
  # #initialize
  # ----------------------------------------

  describe '#initialize' do

    it 'accepts an array as a parameter' do
      expect { TowerOfHanoi.new(win_state) }.to_not raise_error
    end


    it 'sets a the default game state when none provided' do
      expect(toh.towers).to eq([[1, 2, 3], [], []])
    end


    it 'sets the provided game state when present' do
      toh = TowerOfHanoi.new(win_state)
      expect(toh.towers).to eq([[], [], [1, 2, 3]])
    end
  end


  # ----------------------------------------
  # #move
  # ----------------------------------------

  describe '#move' do
    it 'accepts two tower numbers as parameters' do
      expect { toh.move(1, 3) }.to_not raise_error
    end


    it 'moves a disk from the "from" tower to the "to" tower' do
      toh.move(1, 2)
      expect(toh.towers).to eq([[2, 3], [1], []])
    end
  end


  # ----------------------------------------
  # #win?
  # ----------------------------------------

  describe '#win?' do

    it 'returns true when the game has a winning state' do
      toh.towers = [[], [], [1, 2, 3]]
      expect(toh.win?).to eq(true)
    end


    it 'returns false when the game does not have a winning state' do
      expect(toh.win?).to eq(false)
    end
  end


  # ----------------------------------------
  # #valid_move?
  # ----------------------------------------

  describe '#valid_move?' do

    it 'returns true if the move is valid' do
      expect(toh.valid_move?(1, 2)).to eq(true)
    end


    it 'returns false if "from" is the same as "to"' do
      expect(toh.valid_move?(1, 1)).to eq(false)
    end


    it 'returns false if either "from" or "to" is not a valid tower number' do
      expect(toh.valid_move?(0, 1)).to eq(false)
    end


    it 'returns false if the "from" disk cannot be moved to the "to" tower' do
      toh.towers = [[], [1], [2, 3]]
      expect(toh.valid_move?(3, 2)).to eq(false)
    end
  end
end
