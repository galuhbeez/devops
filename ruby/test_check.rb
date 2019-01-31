#!/usr/bin/ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')
coll = db["users"]

coll.find("email" => "matt.galaviz@tealium.com").each { |row| puts row.inspect }
