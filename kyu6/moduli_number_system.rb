#http://www.codewars.com/kata/moduli-number-system/

def fromNb2Str(n, sys)
  sys.inject(:*) > n && 
    sys.combination(2).map { |(x,y)| x.gcd(y) == 1 }.inject(:&) ?
      sys.map{|x| "-#{n % x}-"}.join : "Not applicable"
end