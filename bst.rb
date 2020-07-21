require "pry"

class Node
  attr_accessor :value, :left, :right

  include Comparable

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def has_one_child?
    if self.right == nil && self.left != nil
      return true
    elsif self.left == nil && self.right != nil
      return true
    else
      return false
    end
  end

  def has_two_childs?
    if self.right != nil && self.left != nil
      return true
    else
      return false
    end
  end

  def has_no_childs?
    if self.right == nil && self.left == nil
      return true
    else
      return false
    end
  end

end

class Tree
  
  def initialize(array)
    @array = array
    @root = build_tree(@array)
  end

  def build_tree(input_array)
    array = input_array.uniq.sort
    return if array.empty?
    mid = array.length / 2

    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1..array.length-1])
    return root
  end

  def insert(value, root = @root)
    if value < root.value
      if root.left == nil
        root.left = Node.new(value)
        return root.left
      end
      insert(value, root.left)
    else
      if root.right == nil
        root.right = Node.new(value)
        return root.right
      end
      insert(value, root.right)
    end
  end

  def delete(value, root = @root)
    if value < root.value
      root.left = delete(value, root.left)
    elsif value > root.value
      root.right = delete(value, root.right)
    else
      if root.left == nil
        temp = root.right
        root = nil
        return root
      elsif root.right == nil
        temp = root.left
        root = nil
        return root
      end
      temp = min_value(root.right)
      root.value = temp.value
      root.right = delete(temp.value, root.right)
    end
    return root
  end

  def min_value(root)
    current = root
    while current.left != nil do
      current = current.left
    end
    return current
  end

  def find(value, root = @root)
    return root if value == root.value
    if value < root.value
      find(value, root.left)
    else
      find(value, root.right)
    end
  end
end

binding.pry
