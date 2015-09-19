#http://www.codewars.com/kata/scramblies/

def scramble(s1,s2)
  #your code here
  hash1 = hash_from_string(s1)
  hash2 = hash_from_string(s2)
  hash2.inject(true) { |ret, (key, value)| ret && hash1[key] >= value }
end

def hash_from_string(s)
  hash = Hash.new(0)
  s.chars.each { |c| hash[c] += 1 }
  hash
end