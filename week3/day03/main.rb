$:.unshift File.expand_path("./../lib", __FILE__)
$:.unshift File.expand_path("./../src", __FILE__)

require 'json'
require 'bundler'
require 'google_drive'

require 'write_spreadsheet'
require 'manage_json'
require 'manage_csv'
require 'scrapper'

Bundler.require

@hash = Scrapper.new.launcher()

#ManageJson.new(@hash)
#ManageCsv.new.create(@hash)
WriteSpreadsheet.new.write()