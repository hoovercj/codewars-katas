#http://www.codewars.com/kata/multiplication-tables/

def multiplication_table(x,y)
  arr = Array.new(x) { Array.new(y) }
  arr.each_with_index do |row, i|
    row.each_with_index do |item, j|
      arr[i][j] = (i+1) * (j+1)
    end
  end
end