require "rubygems"
require "bundler/setup"
require "mailman"

class Listener

	def listen()
		# Mailman.config.logger = Logger.new("log/mailman.log")  
		Mailman.config.poll_interval = 3  # Default is 60 seconds
		Mailman.config.pop3 = {
		  server: 'pop.gmail.com', port: 995, ssl: true,
		  username: "emailrubytest",
		  password: "senhaemail.01"
		}
		  Mailman::Application.run do
		  default do
		    begin
		    p "Found a new message"
		    #capture header
		    #header to: /listadeemailNAME/ do
		    #	p params[:captures]
		    # => {
		    #   to: [
		    #     [ 'ell' ]
		    # }
		  	end
		    #capture 

		    #capture message
		    p message.from.first # message.from is an array
		    p message.to.first # message.to is an array again..
		    p message.subject

			parse = Parser.new(message.from.first,message.to.first, message.body.decoded,message.subject,nil)
		    print message.body.decoded
		    rescue Exception => e
		      Mailman.logger.error "Exception occurred while receiving message:n#{message}"
		      Mailman.logger.error [e, *e.backtrace].join("n")
		    end
	  end
end

end

class Parser
	def initialize(author,toList,messageBody,subject,attachedFiles)
		#build objects for new Email and append to list
		from = Author.new(author)
		body = Content.new(messageBody)
		subsystem =  '' #add regex to extract subsystem name
		subject = Subject.new(subject,subsystem)
		message = Message.new(0,'moody',from,subject,body)
	end
end

class Persist
	# persist Email objects to DB
end

class APIout

end
