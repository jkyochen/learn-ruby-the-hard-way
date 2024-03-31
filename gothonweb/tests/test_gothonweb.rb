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
    get '/game'
    assert last_response.body.include?("Central Corridor")
  end

end
