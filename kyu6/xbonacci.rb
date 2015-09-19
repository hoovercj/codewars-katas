#http://www.codewars.com/kata/fibonacci-tribonacci-and-friends/

def Xbonacci(s,n)
  (s.length...n).inject(s.dup){ |arr, m| arr << arr.slice(m-s.length,m).inject(:+) }.take(n)
end