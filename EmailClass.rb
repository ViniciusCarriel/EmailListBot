ass Email
	# this class should group all mails from a same list and subject, which is from just one Patch
	# optimize for mail searches
	def initialize()
		@countMsgs = 0
		@messageList = []
	end

	def updateCount()
		@countMsgs = @countMsgs+1
	end

	def appendNewEmail(message)
		messageList.append(message)
	end
	def searchMessage(key)
		#get emailList and search for a certain string

	end

	def searchPatches(key)
		#search for specific patch emails
	end
end

class Message
	def initialize(isReply,humor,author,subject,content)
		@date = Time.now
		@isReply = isReply
		@humor = humor
		@subject = subject
		@author = author
		@content = content
	end
end

class Subject
	def initialize(fullName,subsystem) #extract tags
		@fullName = fullName
		@subsystem = subsystem
		@patch = Patch.new('Patch 1') #extract patch name
	end
end

class Patch
	def initialize(patchName)
		#initialize tags for further searches
		@tags = []
	end
end

class Author
	def initialize(authorEmail, collaborationCathegory,profile)
		@email = authorEmail
		#NLP input
		@cathegory = collaborationCathegory
		#NLP input
		@profile = profile
	end
end

class Content
	def initialize(content, keywords)
		@rawContent = content
		@keyWords = keywords
	end

end
