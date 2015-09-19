#http://www.codewars.com/kata/turkish-national-identity-number/

def check_valid_tr_number(number)
  #your code here
  arr = number.to_s.split(//).map { |x| x.to_i }
  odds = (0..8).step(2).map { |x| arr[x] }.inject(:+) * 7
  evens = (1..7).step(2).map { |x| arr[x]}.inject(:+)
  ten = arr.first(10).inject(:+)
  arr[0] != 0 && (odds - evens) % 10 == arr[9] && ten % 10 == arr[10]
end