#http://www.codewars.com/kata/tribonacci-sequence/

def tribonacci(signature,n)
  (3...n).inject(signature){ |arr, m| arr << arr[m - 1] + arr[m - 2] + arr[m - 3] }.take(n)
end