require_relative '../lib/bitset'

def sub_arys(ary)
  n = ary.size 
  sub_arys = []
  (0...(1<<n)).each do |i_bits| 
    bitset = BitSet.new(i_bits)
    sub_ary = []
    (0...n).each do |i| 
      sub_ary << ary[i] if bitset[i] == 1
    end
    sub_arys << sub_ary 
  end
  sub_arys 
end

if __FILE__ == $0 
  ary = [1, 2, 3]
  sub_arys(ary).each do |sub_ary| 
    p sub_ary
  end
end