class Tree
  attr_accessor :root
  def initialize(array)
    @root = build_tree(array)
  end

# Builds a balanced binary tree from an array
def build_tree(array)
  return nil if array.empty?
  array = array.uniq.sort
  mid = array.size / 2
  root = Node.new(array[mid])
  root.left = build_tree(array[0...mid])
  root.right = build_tree(array[mid + 1..-1])
  root
end

# Pretty-prints the tree
def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

# Insert a value into the tree
def insert(value, node = @root)
  return Node.new(value) if node.nil?

  return node if node.data == value #don't allow duplicates

  if value < node.data
    node.left = insert(value, node.left)
  elsif value > node.data
    node.right = insert(value, node.right)
  end
  node
end

# Delete a value from the tree
def delete(value, node = @root)
  return node if node.nil?

  if value < node.data
    node.left = delete(value, node.left)
  elsif value > node.data
    node.right = delete(value, node.right)
  else
    return node.left if node.right.nil?
    return node.right if node.left.nil?

    node.data = getSuccessor(node.right)
    node.right = delete(node.data, node.right)
  end
  node
end

# Find the successor of a node
def getSuccessor(node)
  node = node.left until node.left.nil?
  node.data
end

#returns the node with the given value.
def find(value, node = @root)
  return nil if node.nil?

  return node if node.data == value

  value < node.data ? find(value, node.left) : find(value, node.right)
end

# Level order traversal
def level_order(&block)
  return nil if @root.nil?
  result = []
  queue = [@root]
  until queue.empty?
    current = queue.shift
    block_given? ? yield(current.data) : result << current.data
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
  end
  result
end

# Inorder traversal
def inorder(node = @root, &block)
 return nil if node.nil?
 result = []
  inorder(node.left, &block)
  block_given? ? yield(node.data) : result << node.data
  inorder(node.right, &block)
  result
end

# Preorder traversal
def preorder(node = @root, &block)
  return if node.nil?
  result = []
  block_given? ? yield(node.data) : result << node.data
  preorder(node.left, &block)
  preorder(node.right, &block)
  result
end

# Postorder traversal
def postorder(node = @root, result = [], &block)  
  return if node.nil?

  postorder(node.left, result, &block)
  postorder(node.right, result, &block)
  block_given? ? yield(node.data) : result << node.data
  result
end

# Height of the tree

def height(node = @root)
  return -1 if node.nil?

  left_height = height(node.left)
  right_height = height(node.right)
  [left_height, right_height].max + 1
end

# Depth of a node
def depth(value, node = @root, depth = 0)
  return nil if node.nil?

  return depth if node.data == value

  value < node.data ? depth(value, node.left, depth + 1) : depth(value, node.right, depth + 1)
end

# Balanced?
def balanced?(node = @root)
  return true if node.nil?

  left_height = height(node.left)
  right_height = height(node.right)
  return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

  false
end

# Rebalance the tree
def rebalance
  new_array = inorder
  @root = build_tree(new_array)

end


end