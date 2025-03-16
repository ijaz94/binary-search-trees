# Binary Search Tree (BST) Implementation in Ruby

This repository contains a Ruby implementation of a **Binary Search Tree (BST)**. The BST is a node-based data structure where each node has at most two children, referred to as the left child and the right child. This implementation includes methods for building, inserting, deleting, traversing, and rebalancing the tree.

---

## Table of Contents
1. [Features](#features)
2. [Classes](#classes)
   - [Node](#node)
   - [Tree](#tree)
3. [Usage](#usage)
4. [Methods](#methods)
5. [Example](#example)
6. [Contributing](#contributing)
7. [License](#license)

---

## Features

- **Balanced Tree Construction**: Builds a balanced BST from an array of values.
- **Insertion and Deletion**: Supports inserting and deleting nodes while maintaining the BST property.
- **Traversal Methods**: Includes level-order, in-order, pre-order, and post-order traversals.
- **Tree Analysis**: Provides methods to calculate the height, depth, and balance of the tree.
- **Rebalancing**: Automatically rebalances the tree to maintain optimal performance.

---

## Classes

### Node
The `Node` class represents a single node in the BST. Each node contains:
- `data`: The value stored in the node.
- `left`: A reference to the left child node.
- `right`: A reference to the right child node.

### Tree
The `Tree` class manages the BST. It provides methods for building, inserting, deleting, traversing, and rebalancing the tree.

---

## Usage

To use the BST implementation, follow these steps:

1. **Clone the repository** or copy the code into your Ruby project.
2. **Create a new instance** of the `Tree` class with an array of values:
   ```ruby
   array = [3, 5, 7, 10, 12, 15, 17]
   tree = Tree.new(array)
   ```
3. Use the provided methods to manipulate and analyze the tree.

---

## Methods

### `Tree#initialize(array)`
Builds a balanced BST from the given array of values.

### `Tree#build_tree(array)`
Recursively builds a balanced BST from a sorted array.

### `Tree#pretty_print(node, prefix, is_left)`
Prints the tree in a readable format.

### `Tree#insert(value, node)`
Inserts a value into the BST.

### `Tree#delete(value, node)`
Deletes a value from the BST.

### `Tree#find(value, node)`
Returns the node with the given value.

### `Tree#level_order(&block)`
Performs a level-order traversal of the tree.

### `Tree#inorder(node, &block)`
Performs an in-order traversal of the tree.

### `Tree#preorder(node, &block)`
Performs a pre-order traversal of the tree.

### `Tree#postorder(node, &block)`
Performs a post-order traversal of the tree.

### `Tree#height(node)`
Returns the height of the tree.

### `Tree#depth(value, node, depth)`
Returns the depth of a node with the given value.

### `Tree#balanced?(node)`
Checks if the tree is balanced.

### `Tree#rebalance`
Rebalances the tree.

---

## Example

```ruby
require_relative 'lib/node'
require_relative 'lib/tree'

# Create a random array of 15 numbers between 1 and 100
array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)

# Insert numbers greater than 100
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)
tree.insert(161)

# Check if the tree is balanced
puts "Balanced Tree:"
puts tree.balanced?

# Perform traversals
puts "Level Order:"
tree.level_order { |data| print "#{data} " }
puts "\nPreorder:"
tree.preorder { |data| print "#{data} " }
puts "\nPostorder:"
tree.postorder { |data| print "#{data} " }
puts "\nInorder:"
tree.inorder { |data| print "#{data} " }

# Rebalance the tree
tree.rebalance

# Check if the tree is balanced after rebalancing
puts "\n\nRebalanced Tree:"
puts tree.balanced?

# Print the tree
tree.pretty_print
```

---

## Output Example

```
Balanced Tree:
false
Level Order:
50 25 75 12 37 62 87 6 18 31 43 56 68 81 93 101 102 103 104 105 161 
Preorder:
50 25 12 6 18 37 31 43 75 62 56 68 87 81 93 101 102 103 104 105 161 
Postorder:
6 18 12 31 43 37 25 56 68 62 81 93 87 75 50 161 105 104 103 102 101 
Inorder:
6 12 18 25 31 37 43 50 56 62 68 75 81 87 93 101 102 103 104 105 161 

Rebalanced Tree:
true
        ┌── 161
    ┌── 105
    │   └── 104
┌── 103
│   └── 102
101
│   ┌── 93
└── 87
    │   ┌── 81
    └── 75
        │   ┌── 68
        └── 62
            └── 56
```

---

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Enjoy working with Binary Search Trees in Ruby! 🚀