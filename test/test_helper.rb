require 'rubygems'
require 'rack'
require 'rack/test'
require 'test/unit'
$LOAD_PATH.unshift(File.dirname(__FILE__))

config_file = File.read(File.dirname(__FILE__) + '/../config.ru')
rack_application = eval("Rack::Builder.new { #{config_file} }")


