require 'json'
require 'dotenv'

Dotenv.load

class ManageJson
    attr_accessor :hash

    def initialize(hash)
        @hash = hash
        push_data_to_json()
    end

    def push_data_to_json()
        File.open(ENV['JSON'], 'w') do | elem |
            elem.write(@hash.to_json)
        end
    end
end