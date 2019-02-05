#!/usr/bin/ruby

require 'mongo'

require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('-e', '--email EMAIL') { |o| options[:email] = o }
  opt.on('-a', '--account ACCOUNT') { |o| options[:account] = o }
end.parse!

Mongo::Logger.logger.level = ::Logger::FATAL

#create variables from command line arguments
ARGV.each do|a|
end

#Log into mongo core (ie $ mongo 10.1.3.135/core)
client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'core')

#confirm the user exists and has read access to test account:
client[:users].find(:email => options[:email]).each do |doc|
  foo =  doc.values[2]
    if foo == options[:account]
      puts "OK, USA"
    else
      puts "FRANK DUKES NO GO!"      
end

update_data = {"password_policy.mfa" => false }

#make sure MFA is disabled on test account:
client[:accounts].update_one({:account => options[:account]}, '$set' => update_data)
  puts options[:account]

end

update_data = {
	:sso =>
	{
		:saml =>
		{
			:enabled => true,:idp_id => options[:account]
		}
	}
}

client[:accounts].update_one({:account => options[:account]}, '$set' => update_data)

# client[:users].update_one({:email => "chris.galaviz@tealium.com"}, '$set' => {:primary_account => ARGV[0] })


client.close
