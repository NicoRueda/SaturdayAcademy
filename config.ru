ENV['RACK_ENV'] = 'DEVELOPMENT'

require 'rubygems'
require 'bundler/setup'

require './myapp'
run Sinatra::Application