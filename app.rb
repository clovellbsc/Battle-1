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
   # @player_1_name = $game.player1.name
    #@player_2_name = $game.player2.name
    @game = $game
    erb :play
  end

  get '/attack' do
    #@player_1_name = $game.player1.name
    #@player_2_name = $game.player2.name
    @game = $game
    $game.attack($game.player2)
    erb :attack
  end

  run! if app_file == $0
end
