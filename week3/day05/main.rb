$:.unshift File.expand_path('./db', __FILE__)
$:.unshift File.expand_path('./lib', __FILE__)
$:.unshift File.expand_path('./misc', __FILE__)

require 'bundler'

Bundler.require