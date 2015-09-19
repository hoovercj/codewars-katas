#http://www.codewars.com/kata/string-suffixes/

def string_suffix(str)
  (1..str.length).map{ |n| str.chars.last(n) }.inject(0) { |sum, suf| sum += suf.zip(str.chars).take_while { |(x,y)| x == y }.length }
end