require_relative 'lib/node'
require_relative 'lib/tree'

array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)

puts "\nInserting numbers > 100"

tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)
tree.insert(161)

puts "Balanced Tree:"
puts tree.balanced?
puts "Level Order:"
tree.level_order { |data| print "#{data} " }
puts "\nPreorder:"
tree.preorder { |data| print "#{data} " }
puts "\nPostorder:"
tree.postorder { |data| print "#{data} " }
puts "\nInorder:"
tree.inorder { |data| print "#{data} " }

tree.rebalance

puts "\n\nRebalanced Tree:"
puts tree.balanced?

tree.pretty_print

