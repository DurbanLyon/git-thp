require 'google_drive'

class WriteSpreadsheet

    def initialize()
    end

    def write(hash)
        session = GoogleDrive::Session.from_config('config.json')
        doc = session.spreadsheet_by_key(ENV['SPREADSHEET_KEY']).worksheets[0]

        i = 1
        hash.each do | key, value |
            doc[i, 1] = key
            doc[i, 2] = value
            doc.save
            i += 1
        end
    end
end