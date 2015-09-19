#http://www.codewars.com/kata/complete-the-pattern-number-16/

def pattern(n)
  return '' unless n > 0
  arr = Array.new(n) { Array.new(n) }
  (0...n).each { |i|
    (0...n).each { |j|
      j <= i ? arr[i][j] = (n - j) % 10 : arr[i][j] = (n - i) % 10  
    }
  }
  arr.map { |x| x.join() }.join("\n")
end