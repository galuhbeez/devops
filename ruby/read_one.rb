#!/usr/bin/ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

#create variables from command line arguments
ARGV.each do|a|
end

#Log into mongo core (ie $ mongo 10.1.3.135/core)
client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')

#confirm the user exists and has read access to test account:
client[:users].find(:email => ARGV[0]).each do |doc|
  foo =  doc.values[2]
    if foo == "tealium-sso"
      puts "OK, USA"
    else
      puts "FRANK DUKES NO GO!"      
end

#make sure MFA is disabled on test account:
client[:accounts].update_one({:account => ARGV[1]}, '$set' => {"password_policy.mfa" => false })
  puts ARGV[1]

end

client.close
