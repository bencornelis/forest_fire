require_relative "cell"
require_relative "forest"

# p - probability an empty space fills with a tree
# f - probability an isolated tree ignites
p = ARGV[0].to_f
f = ARGV[1].to_f
puts "p = #{p}"
puts "f = #{f}"
sleep 1

forest = Forest.new(p: p, f: f, size: 20)
continue = nil

until continue == "n"
  forest.display

  puts "Continue? (y/n)"
  continue = STDIN.gets.chomp

  forest.next
end

puts "You have exited the forest fire model."
exit
