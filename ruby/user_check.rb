#!/usr/bin/ruby

require 'mongo'



Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')

profiles = db.collection('profiles')

