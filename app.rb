require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    $game.attack
    redirect "/lose" if @game.player1.is_dead? || @game.player2.is_dead?
    erb :attack
  end

  get '/lose' do
    @game = $game
    erb :lose
  end

  run! if app_file == $0
end
