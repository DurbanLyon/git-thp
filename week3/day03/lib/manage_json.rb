require 'json'

class ManageJson
    attr_accessor :hash

    def initialize(hash)
        @hash = hash
        push_data_to_json()
    end

    def push_data_to_json()
        File.open('json/townhalls_mail_data.json', 'w') do | elem |
            elem.write(@hash.to_json)
        end
    end
end