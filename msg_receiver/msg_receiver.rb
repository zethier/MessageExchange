#! /usr/bin/env ruby

# msg_receiver:
#  -- listen to the incoming scan data and diagnostic data from msg_sender
#     then push it to database

require 'sinatra'
require 'haml'
require 'mongo'
require 'json'

MSG_COLLECTION = "msg_collection"

# create a separate collection to collect scan data
# Run once at startup
configure do 
  # Create a new MongoClient instance.
  # MongoClient = function(server, options);
  mongo_msg_host = 'localhost'
  mongo_msg_port = '27017' # default port :27017
  
  # @@mongo_msg_client = Mongo::MongoClient.new(mongo_msg_host, mongo_msg_port)
  # @@mongo_msg_db = @@mongo_msg_client.db(DB)
  # @@mongo_msg_collection = Mongo::MongoClient.db(MSG_COLLECTION)
end

get '/' do
  haml :index, :format => :html5
end

### Message Interface: Message Sender POST to Message Receiver "/incoming" url
get '/incoming' do
  # display incoming data
  p "TBD - to display incoming data"
end

post '/incoming' do
  request.body.rewind  # # in case someone already read it
  # payload = JSON.parse request.body.read 

  # p request.body.read
  payload = JSON.parse(request.body.read)
  puts payload

end