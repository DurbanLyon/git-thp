require 'csv'

class Gossip
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save()
        hash = { @author => @content }
        CSV.open('db/gossip.csv', 'a') do | csv |
            hash.each do | key, value | 
                csv << [ key, value ]
            end
        end
    end

    def self.all()
        all_gossips = []
        CSV.read("db/gossip.csv").each do | csv_line |
          all_gossips << csv_line
        end
        return all_gossips
    end

    def self.find(id)
        array = Gossip.all
        result_author = 'AUTHOR: ' + array[id][0]
        result_content = 'CONTENT: ' + array[id][1]
        return result_author + '<br>' + result_content
    end
end