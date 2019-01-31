#!/usr/bin/ruby

require 'mongo'

ARGV.each do|a|
end

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')

#client[:cars].delete_one({:name => "Skoda"})
client[:users].update_one({:email => "chris.galaviz@tealium.com"}, '$set' => {:primary_account => ARGV[0] })


client.close
