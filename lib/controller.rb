require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do  
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end

  # get '/gossips/:id' do
  #   # matches "GET /hello/foo" and "GET /hello/bar"
  #   # params['name'] is 'foo' or 'bar'
  #   "Voici le numéro du potin que tu veux : #{params["id"]}!"
  # end
  
  # Commente temporairement 
  # get '/gossips/:id' do
  #   Gossip.find(id)
  # end

  get '/gossips/:id' do
    erb :gossip_page, locals: {id: params["id"].to_i ,gossip: Gossip.find(params['id'].to_i)}
  end
# erb :show, locals: {id: params['id'].to_i, gossip: Gossip.find(params['id'].to_i)}
end