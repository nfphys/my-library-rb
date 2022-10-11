module EuclideanAlgorithm 
  def gcd(a, b) 
    a, b = b, a if a < b 
    return a if b === 0
    gcd(b, a%b)
  end
end