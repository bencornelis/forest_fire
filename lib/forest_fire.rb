p = ARGV[0].to_i
f = ARGV[1].to_i

forest = Forest.new
continue = nil

until continue == "n"
  forest.display

  puts "Continue? (y/n)"
  continue = gets.chomp

  forest.next
end

puts "You have exited the model."
exit
