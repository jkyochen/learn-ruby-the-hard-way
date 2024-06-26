require 'sinatra'
require "./lib/gothonweb/map.rb"

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'f74c0a38527151ea4ccf07df053a47d42663226d078c76dd4b84fdd2c3b5c613'

get '/' do
    session[:room] = 'START'
    session[:need_help] = false
    erb :login
end

post '/login' do
    if params[:username].nil? || params[:username].empty?
        username = "Anonymous"
    else
        username = params[:username]
    end
    session[:username] = username
    redirect to('/game')
end

get '/game' do
    room = Map::load_room(session)
    return erb :you_died if !room

    erb :show_room, :locals => {:room => room, :need_help => session[:need_help], :username => session[:username]}
end

post '/help' do
    room = Map::load_room(session)
    return erb :you_died if !room

    session[:need_help] = true
    redirect to('/game')
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
