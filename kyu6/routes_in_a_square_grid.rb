#http://www.codewars.com/kata/routes-in-a-square-grid/

def routes(n)
  return 0 unless n >  0
  arr = Array.new(n+1) { Array.new(n+1) }
  arr[1][1] = 2
  (0..n).to_a.each do |x| 
    arr[0][x] = 1
    arr[x][0] = 1
  end
  arr[0][0] = 0
  
  routes_(arr, n, n)
end

def routes_(arr, x, y)
  arr[x][y] ||= routes_(arr, x - 1, y) + routes_(arr, x, y-1)
end