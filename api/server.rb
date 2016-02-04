require 'sinatra'
require 'ap'
require 'mongo'
require 'json'


def getRecord()
client = Mongo::Client.new([ 'northrend.digitalrogues.com:27017' ], :database => 'magicAPI', :user => 'magic', :password => 'tech0410')
client[:magicObj].find().limit(1).each do |document|
    #=> Yields a BSON::Document.
    pretty  = JSON.pretty_generate(document)
    puts pretty
    return pretty
    end
end


get '/' do
    "<html><pre>#{getRecord()}</pre></html>"
end

get '/json' do
    "#{getRecord()}"
end
