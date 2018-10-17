require 'google_drive'
require 'json'
require 'dotenv'

Dotenv.load

class WriteSpreadsheet

    def initialize()
    end

    def write()
        session = GoogleDrive::Session.from_config('.config.json')
        cell = session.spreadsheet_by_key('1FqZlMqttIJOz5EI839218z9AZqsMrRDI9ArDDo9GI-M').worksheets[0]
      
        emails = JSON.parse(File.read(ENV['JSON']))
        emails.each.with_index {
          | townhall, index |
          cell[index+1, 1] = townhall[0]
          cell[index+1, 2] = townhall[1]
          puts "#{townhall[0]} added to spreadsheet at line #{index+1}"
        }
        cell.save
    end
end