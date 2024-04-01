require "./bin/app.rb"
require "test/unit"
require "rack/test"

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_normal_flow
    get '/'
    follow_redirect!
    assert last_response.body.include?("Central Corridor")
  end

  def test_error_request_order
    get '/game'
    assert last_response.body.include?("You Died!")
  end

  def test_game_win
    get '/'
    post '/game', params={:action => 'tell a joke'}
    follow_redirect!
    assert last_response.body.include?("Laser Weapon Armory")

    post '/game', params={:action => '0132'}
    follow_redirect!
    assert last_response.body.include?("The Bridge")

    post '/game', params={:action => 'slowly place the bomb'}
    follow_redirect!
    assert last_response.body.include?("Escape Pod")

    post '/game', params={:action => '2'}
    follow_redirect!
    assert last_response.body.include?("You won!")
  end

  def test_game_loser
    get '/'
    post '/game', params={:action => 'shoot!'}
    follow_redirect!
    assert last_response.body.include?("You Died!")
  end

  def test_no_action
    get '/'
    post '/game'
    follow_redirect!
    assert last_response.body.include?("Central Corridor")
  end

  def test_died
    post '/game'
    assert last_response.body.include?("You Died!")
  end


end
