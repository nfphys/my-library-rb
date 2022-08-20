def prime_factorize(n)
  factors = []

  i = 1 
  while (i+1)*(i+1) <= n 
    i += 1 
    next if n % i != 0 
    ex = 0 
    while n % i == 0 
      ex += 1 
      n /= i 
    end
    
    factors << [i, ex]
  end

  if n != 1 
    factors << [n, 1]
  end

  factors 
end