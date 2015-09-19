#http://www.codewars.com/kata/x-marks-the-spot/

def x(n)
  ret = Array.new(n) { Array.new(n) }
  ret.each_with_index do |x, i|
    x.each_with_index do |y, j|
      ret[i][j] = i == j || i + j + 1 == n ? 1 : 0
    end
  end
end