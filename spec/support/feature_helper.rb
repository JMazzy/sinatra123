module FeatureHelper
  # Makes a single move
  # and submits the form
  def make_move(from, to)
    fill_in 'From', :with => from
    fill_in 'To', :with => to
    find('form button[type="submit"]').click
  end

  # Submits the form
  # with the sequence of moves
  # that wins the game
  def win_game
    [
      [1, 3],
      [1, 2],
      [3, 2],
      [1, 3],
      [2, 1],
      [2, 3],
      [1, 3]
    ].each do |move|
      from = move[0]
      to = move[1]
      make_move(from, to)
    end
  end
end
