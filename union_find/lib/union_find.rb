require 'set'

class UnionFind 
  attr_reader :number_of_elements
  attr_reader :parents

  def initialize(n)
    @number_of_elements = n
    @parents = Array.new(n)
    @sizes = Array.new(n, 1)
  end

  def root(x) 
    return x if self.parents[x].nil?
    self.parents[x] = self.root(parents[x]) 
  end

  def same?(x, y)
    self.root(x) == self.root(y)
  end

  def unite(x, y)
    x_root = root(x)
    y_root = root(y)

    return false if x_root == y_root 

    # union by size
    x_root, y_root = y_root, x_root if sizes[x_root] < sizes[y_root]

    parents[y_root] = x_root 
    sizes[x_root] += sizes[y_root]

    true
  end

  def groups 
    groups = Hash.new

    (0...self.number_of_elements).each do |i|
      i_root = self.root(i)
      if groups.has_key?(i_root)
        groups[i_root] << i
      else
        groups[i_root] = Set.new([i])
      end
    end

    groups
  end

  def size(x)
    @sizes[root(x)]
  end

  def to_s 
    groups = self.groups 

    string = ""
    groups.each do |root, members|
      string << ", " unless string.empty?
      string << "{" + members.join(", ") + "}"
    end

    string
  end

  def inspect 
    self.to_s 
  end

  private 

  attr_reader :sizes
end
