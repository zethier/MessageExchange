#! /usr/bin/env ruby

# msg_receiver:
#  -- listen to the incoming scan data and diagnostic data from msg_sender
#     then push it to database

require 'sinatra'
require 'haml'
require 'mongo'
require 'json'

MSG_DB = "msg_exchange_database"
MSG_DATA_COLLECTION = "msg_data"

# create a separate collection to collect scan data
# Run once at startup

# running MongoDB with ruby
# https://github.com/mongodb/mongo-ruby-driver/wiki/Tutorial
configure do 
  puts "Start Configuration"
  
  # Create a new MongoClient instance.
  # MongoClient = function(server, options);
  mongo_msg_host = "localhost"
  mongo_msg_port = 27017 # default port :27017
  
  # make a connection "@@msg_collection"
  @@msg_conn = Mongo::MongoClient.new(mongo_msg_host, mongo_msg_port)

  puts @@msg_conn.database_names  
  @@msg_conn.database_info.each {|info| puts info.inspect}

  # using MongoClient instant to obtain a Mongo::DB instance
  @@msg_db = @@msg_conn.db(MSG_DB)  
  
  # create collections in Mongo::DB
  @@msg_collection = @@msg_db.collection(MSG_DATA_COLLECTION)
  
  puts "Done Configuration"
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
  
  # insert documentation into collection
  msg_id = @@msg_collection.insert(payload)

  puts "Getting incoming data: #{payload}, collection id: #{msg_id}"  
end

