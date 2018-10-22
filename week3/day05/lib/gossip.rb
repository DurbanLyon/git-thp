require 'csv'

class Post
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save_data()
        hash = { @author => @content }
        CSV.open('db/gossip.csv', 'a') do | csv |
            csv << [ 'AUTHOR', 'CONTENT' ]
            hash.each do | key, value | 
                csv << [ key, value ]
            end
        end
    end

    def read_data()
        rows = []
        CSV.foreach('db/gossip.csv') { |row|
        if row[0].to_s.size > 0 || row[1].to_s.size > 0
            rows << row
        end
        }
        return rows
    end
end