#http://www.codewars.com/kata/weight-for-weight/

def order_weight(string)
    string.split(' ').sort_by{ |s| [score(s), s] }.join(' ')
end

def score(string)
  string.chars.inject(0) { |sum, c| sum += c.to_i }
end