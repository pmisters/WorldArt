begin
  require "spec"
rescue LoadError
  require "rubygems"
  gem 'rspec'
  require "spec"
end

$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'worldart'

def read_fixtures(path)
  File.read File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', path))
end

REMOTE_SAMPLES = {
  'http://www.world-art.ru/cinema/cinema.php?id=24154' => '24154',
  'http://www.world-art.ru/cinema/cinema.php?id=26082' => '26082',
  'http://www.world-art.ru/search.php?global_sector=cinema&name=%CD%E0%F7%E0%EB%EE' => 'search_nacnalo'
}

unless ENV['LIVE_TEST']
  begin
    require "rubygems"
    require "fakeweb"
    
    FakeWeb.allow_net_connect = false
    REMOTE_SAMPLES.each do |url, response|
      FakeWeb.register_uri :get, url, :response => read_fixtures(response)
    end
    
  rescue LoadError
    puts 'Could not load FakeWeb, this test will hit World-Art.ru'
    puts 'You can run `gem install fakeweb` to stub out the responses.'
  end
end
