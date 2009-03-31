require File.dirname(__FILE__) + '/test_helper'

class TestContent < Test::Unit::TestCase
  
  include Rack::Test::Methods

  def app
    app = Rack::Builder.new {
      use NuCMS::Content
      run Rack::NotFound.new('404.txt')
    }
  end


  def test_valid_page
    get '/foo'
    puts last_response.inspect
    assert last_response.ok?
  end

  def test_failed_page
    get '/asd'
    assert !last_response.ok?
  end

end
