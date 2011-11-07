from Character import Character, ENDMARK

"""
A Scanner object reads through the sourceText
and returns one character at a time.
"""
class Scanner:
	def __init__(self, sourceTextArg):
		self.sourceText = sourceTextArg
		self.lastIndex = len(self.sourceText) - 1
		self.sourceIndex = -1
		self.lineIndex = 0
		self.colIndex = -1


	#-------------------------------------------------------------------
	#
	#-------------------------------------------------------------------
	def __iter__(self):
		return self
	
	def next(self):
		"""
		Return the next character in sourceText.
		"""
	
		while True:
			self.sourceIndex += 1	# increment the index in sourceText

			# maintain the line count
			if self.sourceIndex > 0:
				if self.sourceText[self.sourceIndex - 1] == "\n":
					#-------------------------------------------------------
					# The previous character in sourceText was a newline
					# character.  So... we're starting a new line.
					# Increment lineIndex and reset colIndex.
					#-------------------------------------------------------
					self.lineIndex +=1
					self.colIndex  = -1
	
			self.colIndex += 1
	
			if self.sourceIndex > self.lastIndex:
				# We've read past the end of sourceText.
				# Return the ENDMARK character.
				char = Character(ENDMARK, self.lineIndex, self.colIndex, self.sourceIndex, self.sourceText)
			else:
				c	= self.sourceText[self.sourceIndex]
				char = Character(c, self.lineIndex, self.colIndex, self.sourceIndex, self.sourceText)
	
			if char.cargo == ENDMARK:
				raise StopIteration
			return char
