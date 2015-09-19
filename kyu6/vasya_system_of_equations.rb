#http://www.codewars.com/kata/vasya-and-system-of-equations/

def solution(n, m)
  f = lambda { |a,n,m| a + (n - a**2)**2 - m }
  g = lambda { |a,n| a**2 - n }
  (1..(Math.sqrt(n).ceil)).select { |x| f[x,n,m] == 0 && g[x,n] <= 0 }.length
end