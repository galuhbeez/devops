#!/usr/bin/ruby

require 'mongo'
#require 'active_support'
#require 'json'

Mongo::Logger.logger.level = ::Logger::FATAL

ARGV.each do|a|
  puts "Argument: #{a}"
end


client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')

client[:users].find(:email => ARGV[0]).each do |doc|
  foo =  doc.values[2]
    if foo == "tealium-sso"
      puts "USA OOOOOK!!!"
    else
      puts "FRANK DUKES NO GO!"      


client[:accounts].update_one({:account => ARGV[1]}, '$set' => {"password_policy.mfa" => false })
  puts ARGV[1]

end


end
client.close
