require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  get '/' do
  	erb(:index)
  end

  post '/names' do
  	player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    @game = $game
    @game.attack($game.opposite_player)
    if @game.game_over?
      redirect '/game_over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @message = $game.attack_message
    erb(:attack)
  end

  post '/heal' do
    @game = $game
    @game.heal($game.current_turn)
    redirect'/heal'
  end

  get '/heal' do
    @message = $game.attack_message
    erb(:attack)
  end

  post '/sleep' do
    @game = $game
    @game.sleep($game.opposite_player)
    redirect'/sleep'
  end

  get '/sleep' do
    @message = $game.attack_message
    erb(:attack)
  end

  get '/game_over' do
    @losing_player = $game.losing_player.name
    @winning_player = $game.winning_player.name
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
