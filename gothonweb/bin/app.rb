require 'sinatra'
require "./lib/gothonweb/map.rb"

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'f74c0a38527151ea4ccf07df053a47d42663226d078c76dd4b84fdd2c3b5c613'

session = {}

get '/' do
    session[:room] = 'START'
    redirect to('/game')
end

get '/game' do
    room = Map::load_room(session)
    return erb :you_died if !room

    erb :show_room, :locals => {:room => room}
end

post '/game' do
    room = Map::load_room(session)
    return erb :you_died if !room

    action = params[:action] || "*"
    next_room = room.go(action)

    if next_room
        Map::save_room(session, next_room)
    end

    redirect to('/game')
end
