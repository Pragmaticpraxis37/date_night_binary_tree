class BinarySearchTree

  def initialize
    @tree = nil
  end

  def insert(score, title)
    node = Node.new(score, title)

    depth = 0

    tracker = @tree

    if @tree == nil
      @tree = node
    else
      while tracker != nil
        if score > tracker.score && tracker.right_node == nil
          tracker.right_node = node
          depth += 1
          break
        elsif score > tracker.score
          tracker = tracker.right_node
          depth += 1
        elsif score < tracker.score && tracker.left_node == nil
          tracker.left_node = node
          depth += 1
          break
        elsif score < tracker.score
          tracker = tracker.left_node
          depth += 1
        end
      end
    end

    depth
  end

  def include?(score)
    tracker = @tree

    result = false

    while tracker != nil
      if score == tracker.score
        result = true
        break
      elsif score < tracker.score
        tracker = tracker.left_node
      elsif score > tracker.score
        tracker = tracker.right_node
      end
    end

    result
  end

  def depth_of(score)
    tracker = @tree

    depth = 0

    found = false

    while tracker != nil
      if score == tracker.score
        found = true
        break
      elsif score < tracker.score
        depth += 1
        tracker = tracker.left_node
      elsif score > tracker.score
        depth += 1
        tracker = tracker.right_node
      end
    end

    if !found
      depth = nil
    end

    depth
  end

  def max
    tracker = @tree

    while tracker != nil
      max = {}
      max[tracker.title] = tracker.score
      tracker = tracker.right_node
    end

    max
  end

  def min
    tracker = @tree

    while tracker != nil
      min = {}
      min[tracker.title] = tracker.score
      tracker = tracker.left_node
    end

    min
  end

  def sort
    structure = @tree
    stack = []
    result = []

    while structure != nil || !stack.empty? do
      while structure != nil do
        stack << structure
        structure = structure.left_node
      end

      structure = stack.pop
      result << create_hash(structure.score, structure.title)
      structure = structure.right_node
    end

    result
  end

  def health(depth)
    
  end

  def create_hash(score, title)
    hash = {}
    hash[title] = score
    hash
  end

end




























# def sort
#   stack = []
#   result = []
#   root = @tree
#
#   while !stack.empty? || root != nil
#     require "pry"; binding.pry
#     while root != nil
#       require "pry"; binding.pry
#       stack.append(root)
#       require "pry"; binding.pry
#       root = root.left_node
#       require "pry"; binding.pry
#     end
#
#     root = stack.pop
#     require "pry"; binding.pry
#     result.append(root.score)
#     require "pry"; binding.pry
#     root = root.right_node
#   end
# require "pry"; binding.pry
# end
