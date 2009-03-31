require 'rack'
require 'rack/contrib'
require 'lib/content'
require 'rdiscount'

use NuCMS::Content
run Rack::NotFound.new('404.txt')

