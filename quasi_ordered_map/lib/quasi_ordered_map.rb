class QuasiOrderedMap
  def self.from_hash(hash)
    keys = hash.keys.sort 
    self.new(keys, hash)
  end

  attr_reader :keys 
  attr_reader :hash 

  def initialize(keys=[], hash=Hash.new)
    @keys = keys 
    @hash = hash
  end 

  def [](key)
    hash[key]
  end

  def []=(key, value)
    hash[key] = value 
    key_index = keys.bsearch_index { |x| x >= key }
    if key_index  
      keys.insert(key_index, key)
    else 
      keys << key 
    end
  end

  def has_key?(key)
    hash.has_key?(key)
  end

  def delete(key)
    i = keys.bsearch_index { |x| x >= key }
    return if keys[i] != key 
    keys.delete_at(i)
    hash.delete(key)
  end

  def lower_bound(key)
    keys.bsearch { |x| x >= key }
  end
end