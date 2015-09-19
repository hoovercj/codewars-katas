#http://www.codewars.com/kata/triple-trouble-1/solutions/ruby

def triple_double(num1,num2)
    (0..9).to_a.select { |n| num1.to_s =~ /#{n}{3}/ && num2.to_s =~ /#{n}{2}/ }.length
end