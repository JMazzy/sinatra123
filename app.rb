require 'sinatra'
require_relative 'lib/tower_of_hanoi'

enable :sessions

get '/' do

  if session['win'] && session['reset']
    session['towers'] = nil
    session['reset'] = false
    session['win'] = false
  end

  @toh = TowerOfHanoi.new(session['towers'])

  session['towers'] = @toh.towers
  session['win'] = @toh.win?
  session['reset'] = true if session['win']

  erb :game, locals: { towers: @toh.towers, valid_move: session['valid_move'], win: session['win'] }
end

post '/move' do
  @toh = TowerOfHanoi.new(session['towers'])
  from = params['from'].to_i
  to = params['to'].to_i

  if session['valid_move'] = @toh.valid_move?(from,to)
    @toh.move(from,to)
  end

  # win if @toh.win?
  redirect '/', method: 'get'
end
