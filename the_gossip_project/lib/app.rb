
require 'gossip'                                         #tells our app to use gossip.rb

class GossipProjectApp < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all}             #erb -> retrive index.reb, locals -> get local variables, here those in class Gossip, with self method. See Gossip.rb. 
		 
	end
	get '/gossips/new' do
		erb  :new_gossip
	end 
	post '/gossips/new' do 
		Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save          #applies new and save
	
	
		puts "#{params}"
		puts "#{params["gossip_author"]}"
		puts "#{params["gossip_content"]}"             #will print to console, this is optional, but avoids ugly code being default printed on page.
		redirect '/'                                   #will redirect after to 'home'
		
	end
	
	get '/gossips/:id' do
		erb :gossip, locals: {gossip: Gossip.find(params['id'])}
	end
end
