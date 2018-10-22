require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save()
    redirect '/'
  end

  get '/gossips/*' do
    puts "Voici le numéro du potin que que tu veux : #{params['splat']} !"
    id = params['splat']
    Gossip.find(id[0].to_i)
  end
end