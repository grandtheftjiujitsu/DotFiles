# Codecademy - Ruby - Introduction to Ruby

# single line comment
=begin
This is
a multiline
comment
=end

# puts - line break after string
# print - no line break
print "print and"
puts " puts"
puts "puts 1"
puts "puts 2"
puts "puts 3"
print "print 1"
print "print 2"
print "print 3"
puts ""
puts "Data Types:"
puts "- numbers (13)"
puts "- boolean (true / false)"
puts "- string ('I am learning Ruby')"
puts ""
puts "Variables:"
my_num = 100
my_bool = true
my_string = "Ruby String"
puts my_num
puts my_bool
puts my_string
puts ""
puts "Math:"
puts "- addition (+)"
puts "- subtraction (-)"
puts "- multiplication (*)"
puts "- division (/)"
puts "- exponentation (**)"	# X**Y = X to the Y power
puts "- modulo (%)"		# X%Y = remainder of X / Y
puts 2+3
puts 2-3
puts 2*3
puts 2/3
puts 2**3
puts 11%5
puts ""
puts "Methods:"
# called from inside interpreter (like starting python interpreter)
# or with preceeding 'puts' command
puts "  .length		number of characters"
puts "  .reverse	reverse order of string"
puts "  .upcase		all capital letters"
puts "  .downcase	all lower case letters"
puts my_string.length
puts my_string.reverse
puts my_string.upcase
puts my_string.downcase
puts ""
puts "Chaining Strings:"
name = "Austin"
low = name.downcase
rev = low.reverse
up = rev.upcase
print "Method 1:  "
puts up
print "Method 2:  "
puts name.downcase.reverse.upcase
