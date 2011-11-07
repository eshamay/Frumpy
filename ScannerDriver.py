import Scanner as Scanner
import sys

#-------------------------------------------
# support for writing output to a file
#-------------------------------------------
def writeln(*args):
	for arg in args:
		f.write(str(arg))
	f.write("\n")

#-----------------------------------------------------------------------
#
#					main
#
#-----------------------------------------------------------------------
def main(sourceText):
	global f
	f = open(outputFilename, "w")	  # open the ouput file

	writeln("Here are the characters returned by the scanner:")
	writeln("  line col  character")

	# create a scanner (an instance of the Scanner class)
	S = Scanner.Scanner(sourceText)

	#------------------------------------------------------------------
	# Call the scanner's get() method repeatedly
	# to get the characters in the sourceText.
	# Stop when we reach the ENDMARK.
	#------------------------------------------------------------------
	for c in S:
		writeln(c)

	f.close()  # close the output file


#-----------------------------------------
#			  run
#-----------------------------------------
if __name__ == "__main__":
	outputFilename = "test.out"
	sourceText = open(sys.argv[1]).read()
	main(sourceText)
	#print open(outputFilename).read()
