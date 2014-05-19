#! /usr/bin/env ruby

require 'json'
require 'rest-client'

# require 'sinatra'

# post json data
message = {
  :date => "2014-05-15",
  :time => "16:27",
  :expectedPDS => "5",
  :foundPDS => "4",
  :expectedFixture => "20",
  :logsNewestTS => "16"
}.to_json 

# message = JSON.generate(["hello world"])
puts message

# http put vs post
# http://stackoverflow.com/questions/630453/put-vs-post-in-rest
#   put - create or update
#   post - create
# RestClient.put 'http://localhost:7654/incoming', message, {:content_type => :json}
RestClient.post 'http://localhost:7654/incoming', message, {:content_type => :json}
# RestClient.post 'http://localhost:7654/incoming', {:data => message}, {:content_type => :json}
#                                                   ~~~~~~~~~~~~~~~~~ this is wrong!!!

# sanity check locally
data = JSON.parse(message)
puts data
