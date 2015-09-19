#http://www.codewars.com/kata/is-my-friend-cheating/

def removNb(n)
  f = lambda { |n,x| (((n*n + n) / 2) - x) / (x + 1) }
  arr = (1..n).map do |x| 
    y = f[n,x]
    y > 0 && y <= n && y * x + x + y == ((n*n + n) / 2) ? [x,y] : nil 
  end
  arr.compact
end