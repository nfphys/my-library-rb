class BinaryIndexedTree 

  attr_reader :size 

  def initialize(n, v_init=nil)
    @size = n 
    @nodes = Array.new(n+1, 0)
    if v_init 
      (1..@size).each do |i| 
        add(i, v_init)
      end
    end
  end

  # v[a] += w 
  def add(a, w)
    x = a
    while x <= size 
      nodes[x] += w 
      x += interval_length(x)
    end
  end

  # v[1] + ... + v[a]
  def sum(a)
    prefix_sum = 0 
    x = a 
    while x > 0 
      prefix_sum += nodes[x]
      x -= interval_length(x)
    end
    prefix_sum 
  end

  def to_a 
    prefix_sums = Array.new(size+1, 0)
    (1..size).each do |a|
      prefix_sums[a] = sum(a)
    end

    ary = Array.new(size+1)
    (1..size).each do |a| 
      ary[a] = prefix_sums[a] - prefix_sums[a-1]
    end

    ary[1..size] 
  end

  private 

  # nodes[x]: x番目のノードの値
  attr_reader :nodes 

  # x番目のノードが管理する区間の長さ
  def interval_length(x)
    x & (-x)
  end

end