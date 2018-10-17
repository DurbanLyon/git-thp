require 'csv'
require 'dotenv'

Dotenv.load

class ManageCsv

    def initialize()
    end

    def create(hash)
        CSV.open(ENV['CSV'], 'wb') do | csv |
            csv << [ 'NAME', 'MAIL' ]
            hash.each do | key, value | 
                csv << [ key, value ]
            end
        end
    end
end