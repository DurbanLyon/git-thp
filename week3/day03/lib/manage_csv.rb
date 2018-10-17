require 'google_drive'
require 'csv'

class ManageCsv

    def initialize()
    end

    def create(hash)
        CSV.open('/Users/c0dex/Laboratory/main-thp/git-thp/week3/day03/db/townhalls_mail_data.csv', 'a+') do | csv |
            csv << hash.keys
            csv << hash.values
        end
    end
end