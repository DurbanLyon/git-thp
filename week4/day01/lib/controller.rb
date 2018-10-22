require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    puts "HELLO"
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new/' do
    puts "JE SUIS DANS LA ROUTE GOSSIP NEW"
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "JE FAIS UNE REQUETE POST DANS LA ROUT GOSSIP NEW"
    Gossip.new(params['gossip_author'], params['gossip_content']).save()
    redirect '/'
  end

  get '/gossips/*' do
    puts "Voici le numéro du potin que que tu veux : #{params['splat']} !"
    id = params['splat']
    Gossip.find(id[0].to_i)
  end
end