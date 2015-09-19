#http://www.codewars.com/kata/validate-sudoku-with-size-nxn/

class Sudoku
  def initialize(arrs)
    @board = arrs
    @n = arrs.length
    @sqn = Math.sqrt(@n).round
    @expected_sum = (1..arrs.length).inject(:+)
    @expected_arr = (1..arrs.length).to_a
    @square = arrs.reject { |x| x.length == @n }.empty?
  end
  
  def is_valid
    @square && [@board, @board.transpose, generate_quads].map { |x| 
      x.map { |y| validate_arr(y)}}.flatten.inject(:&)
  end
  
  def validate_arr(arr)
    arr.inject(:+) == @expected_sum && (arr - @expected_arr).empty?
  end
  
  def generate_quads
    quads = Array.new(@n) { Array.new() }
    @board.each_with_index { |row, row_index|
      row.each_with_index { |element, col_index|
        quads[get_quad(row_index, col_index)] << element
      }
    }
    quads
  end
  
  def get_quad(x,y)
    x / @sqn + @sqn * (y / @sqn)
  end
end