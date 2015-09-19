#http://www.codewars.com/kata/how-much/

def howmuch(m, n)
    ([[m,n].min,9].max..[m,n].max).select { |x| x % 9 == 1 && x % 7 == 2 }.map { |x| ["M: #{x}", "B: #{x/7}", "C: #{x/9}"] }
end