require 'rubygems'
require 'rack'
require 'rack/contrib'
require 'lib/content'
require 'lib/template'


use NuCMS::Content
run Rack::NotFound.new('404.txt')

