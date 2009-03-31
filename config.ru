require 'rack'
require 'rack/contrib'
require 'lib/content'

use Rack::ETag
use NuCMS::Content
run Rack::NotFound.new('404.txt')

