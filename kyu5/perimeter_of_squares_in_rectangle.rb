#http://www.codewars.com/kata/perimeter-of-squares-in-a-rectangle/

def perimeter(n) 
    4 * (helper(n + 2) -1)
end

def helper(n)
    a,b,p,q = 1,1,0,1
    while n > 0 do
        if n.even?
            p, q, n = p*p + q*q, 2*p*q + q*q, (n / 2).floor
        else
            a, b, n = b*q + a*q + a*p, b*p + a*q, n - 1
        end
    end
    b
end