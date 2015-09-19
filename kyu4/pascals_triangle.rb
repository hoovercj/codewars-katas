#http://www.codewars.com/kata/pascals-triangle/

def pascalsTriangle(n)
  arr = []
  count = 0
  
  (1..n).each do |lvl|
    (1..lvl).each do |col|
      par_a_index = count - lvl
      par_b_index = par_a_index + 1
      par_a = arr[par_a_index]
      par_b = arr[par_b_index]
      new_value = (col == 1 || col == lvl) ? 1 : par_a + par_b
      arr << new_value
      count += 1
    end
  end
  arr
end