class QuasiMultiSet 
  attr_reader :keys 
  attr_reader :hash 

  def initialize(ary=[])
    @keys = []
    @hash = Hash.new(0)

    sorted_ary = ary.sort 
    sorted_ary.each do |x| 
      hash[x] += 1
      if keys.empty? || keys.last != x 
        keys << x 
        next 
      end
    end
  end

  def insert(key, count=1)
    if hash.has_key?(key) 
      hash[key] += count
      return 
    end

    hash[key] += count 
    key_index = keys.bsearch_index { |x| x >= key }
    if key_index
      keys.insert(key_index, key)
    else 
      keys << key 
    end 
  end

  def delete(key, count=1)
    key_index = keys.bsearch_index { |x| x >= key }
    return if key_index.nil?
    return if keys[key_index] != key 
    if hash[key] > count 
      hash[key] -= count 
    else
      keys.delete_at(key_index)
      hash.delete(key)
    end
  end

  def count(key)
    hash[key]
  end

  def empty? 
    keys.empty? 
  end

  def max 
    return if self.empty? 
    keys.last 
  end

  def min 
    return if self.empty? 
    keys.first 
  end

  def lower_bound(key)
    keys.bsearch { |x| x >= key }
  end

  def upper_bound(key)
    key_index = keys.bsearch_index { |x| x > key }
    return keys.last if key_index.nil? 
    key_index -= 1
    return if key_index.negative? 
    keys[key_index]
  end
end