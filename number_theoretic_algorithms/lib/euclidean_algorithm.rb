module EuclideanAlgorithm 
  # 整数 a, b の最大公約数を求める。
  def gcd(a, b) 
    a, b = b, a if a.abs < b.abs
    return a.abs if b === 0
    gcd(b, a%b)
  end

  # 整数 a, b に対する Bezout's identity
  #   ax + by = gcd(a, b)
  # の解を一つ求める。
  def solve_bezout(a, b) 
    if a.abs < b.abs
      y, x = solve_bezout(b, a)
      return [x, y]
    end 

    if b === 0
      return [a >= 0 ? 1 : -1, 0] 
    end

    r = a%b 
    q = (a-r)/b
    s, t = solve_bezout(b, r)
    [t, s - q*t]
  end
end