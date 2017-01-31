class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    return if node.nil?
    node.children << self unless node.children.include?(self)
    @parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'this child doesnt exist' unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    children.each do |child|
      result = child.dfs(target)
      next if result.nil?
      return result
    end
    nil
  end

  def bfs(target)
    nodes = [self]
    until nodes.empty?
      first_node = nodes.shift
      return first_node if first_node.value == target
      nodes.concat(first_node.children)
    end
  end

end
