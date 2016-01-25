require 'sinatra'
require_relative 'lib/tower_of_hanoi'

enable :sessions

get '/' do
  @toh = TowerOfHanoi.new(session['towers'])

  

  session['towers'] = @toh.towers

  erb :game, locals: { towers: @toh.towers }
end

post '/move' do
  @toh = TowerOfHanoi.new

  redirect '/'
end
