require 'googleauth'
require 'google_drive'
require 'json'
require 'dotenv'

Dotenv.load

class WriteSpreadsheet

    def initialize()
    end

    #doesnt work#
    def write()
        session = GoogleDrive::Session.from_config('.config.json')
        doc = session.spreadsheet_by_key(ENV['SPREADSHEET']).worksheets[0]

        json = File.read(ENV['JSON'])
        content = JSON.parse(json)
    
        content.each_with_index  do | key, value |
           doc[index + 1] = key
           doc[index + 1] = value
        end
        doc.save
    end
end