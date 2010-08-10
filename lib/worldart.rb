$: << File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'hpricot'
require 'net/http'
require 'iconv'

require 'worldart/movie'
require 'worldart/search'

module Worldart
  VERSION = File.read(File.join(File.dirname(__FILE__), '..', 'VERSION')).strip
end
