#!/usr/bin/env ruby

require 'mongo'

client = Mongo::Client.new([ '192.168.99.100:32768' ], :database => 'music')

# result = client[:artists].insert_one({ name: 'FKA Twigs' })
# puts result #=> returns 1, because 1 document was inserted.
#
# result = client[:artists].insert_many([
#   { :name => 'Flying Lotus' },
#   { :name => 'Aphex Twin' }
# ])
# puts result #=> returns 2, since 2 documents were inserted.
# client[:artists].find().each do |document|
#   #=> Yields a BSON::Document.
#   puts document
# end
puts client.database_names
