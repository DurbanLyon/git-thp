require 'pry'
require 'dotenv'
require 'httparty'
require 'base64'

Dotenv.load

def cipheriser()
    cipher = String.new
    cipher = "#{ENV['SPOTIFY_CLIENT_ID']}:#{ENV['SPOTIFY_SECRET_ID']}"
    cipher = Base64.strict_encode64(cipher)
    return cipher = 'Basic ' + cipher
end

POST = HTTParty.post(
    "https://accounts.spotify.com/api/token",
    :headers => {'Authorization' => "#{cipheriser()}"},
    :body => {:grant_type => 'client_credentials'}
)

GET = HTTParty.get(
    'https://api.spotify.com/v1/browse/new-releases?limit=2',
    :headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer #{ENV['ACCESS_TOKEN']}"
    },
)