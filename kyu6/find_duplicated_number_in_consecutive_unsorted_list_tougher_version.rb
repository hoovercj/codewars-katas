#http://www.codewars.com/kata/find-the-duplicated-number-in-a-consecutive-unsorted-list-tougher-version/

def find_dup(arr)
  hash = Hash.new(0)
  arr.each do |x| 
    hash[x] += 1
    return x if hash[x] == 2
  end
end