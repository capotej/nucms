require 'rubygems'
require 'rack'
require 'hpricot'
require 'erb'
require 'rack/contrib'
require 'lib/content'
require 'lib/template'

use Rack::ResponseCache, "cache"
use NuCMS::Content
use Rack::Static, :urls => ["/css", "/images", "/js", "/javascripts"], :root => "template"
run Rack::NotFound.new('404.txt')

