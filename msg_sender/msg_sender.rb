#! /usr/bin/env ruby

require 'json'
require 'rest-client'

get "/" do 
  # post json data
  message = {
    :date => "2014-05-15",
    :time => "16:27",
    :expectedPDS => 5,
    :foundPDS => 4,
    :expectedFixture => 20,
    :logsNewestTS => 16
  }.to_json
  
  RestClient.Post 'http://localhost:7654/incoming', {:data => message}, {:content_type => :json}
end