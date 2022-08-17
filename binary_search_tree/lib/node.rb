class Node 
  attr_accessor :key 

  attr_accessor :value

  attr_accessor :color 

  # selfを根とする部分木の高さ
  attr_reader :height 

  # selfの親ノード
  attr_accessor :parent

  # selfの左の子ノード
  attr_reader :left 

  # selfの右の子ノード
  attr_reader :right 

  def initialize(key:, value: nil, color: nil)
    @key    = key 
    @value  = value
    @color  = color
    @height = 0
    @parent = nil 
    @left   = nil  
    @right  = nil  
  end

  Nil = self.new(key: nil, color: :black)

  def left=(other)
    @left = other
    other.parent = self if other 
  end

  def right=(other)
    @right = other 
    other.parent = self if other
  end

  # selfの左部分木と右部分木の高さが正しいと仮定して、
  # selfを根とする部分木の高さを求める
  def update_height 
    if self.left && self.right 
      h_left  = self.left.height 
      h_right = self.right.height 
      @height = (h_left > h_right ? h_left : h_right) + 1
    elsif self.left 
      @height = self.left.height + 1
    elsif self.right 
      @height = self.right.height + 1
    else 
      @height = 0 
    end
  end

  # selfの平衡係数 := (右部分木の高さ) - (左部分木の高さ)
  def balance_factor 
    h_left  = self.left  ? self.left.height  : 0
    h_right = self.right ? self.right.height : 0
    h_right - h_left 
  end

  def destroy 
    @key    = nil 
    @value  = nil
    @height = 0
    @color  = nil
    @parent = nil 
    @left   = nil  
    @right  = nil 
  end
end