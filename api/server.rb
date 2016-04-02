require 'sinatra'
require 'ap'
require 'mongo'
require 'json'
require 'em/pure_ruby'

set :bind, '0.0.0.0'

def getRecord()
@host = "mongo"
client = Mongo::Client.new([ "#{@host}:27017" ], :database => 'magicAPI')
client[:magicObj].find().sort(:lastUpdated_unix => -1).limit(1).each do |document|
    #=> Yields a BSON::Document.
    pretty  = JSON.pretty_generate(document)
    puts pretty
	client.close
    return pretty
    end
end


get '/' do
    "<html><pre>#{getRecord()}</pre></html>"
end

get '/json' do
    "#{getRecord()}"
end
