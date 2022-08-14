require_relative '../lib/binary_indexed_tree'

def calc_inversion_number(ary)
  sorted_ary = ary.sort 

  # ary_set[n]: 配列aryにおいてn番目に小さい値
  ary_set = []
  sorted_ary.each do |a|
    if ary_set.empty? || ary_set.last != a 
      ary_set << a 
    end
  end

  # order[a] = i => 配列aryにおいて、aはi番目に小さい
  order = Hash.new 
  ary_set.each.with_index(1) do |a, i| 
    order[a] = i
  end

  # freq_bit.sum(k): 配列aryにおける1~k番目の値の出現頻度
  freq_bit = BinaryIndexedTree.new(ary_set.size)
  inversion_number = 0
  ary.each.with_index do |a, j| 
    inversion_number += j - freq_bit.sum(order[a])
    freq_bit.add(order[a], 1)
  end

  inversion_number
end