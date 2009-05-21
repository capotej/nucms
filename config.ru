require 'rubygems'
require 'rack'
require 'hpricot'
require 'erb'
require 'rack/contrib'
require 'lib/content'
require 'lib/template'
require 'lib/template_methods'

use NuCMS::Content
use Rack::Static, :urls => ["/"], :root => "template"
run Rack::NotFound.new('404.txt')

