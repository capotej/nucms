require 'rubygems'
require 'test/unit'
require 'rack'
require 'rack/test'
require 'rack/contrib'
require 'rack/config'
require 'rdiscount'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lib/content'

