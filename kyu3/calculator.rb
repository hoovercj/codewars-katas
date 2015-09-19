#http://www.codewars.com/kata/calculator/

class Calculator
  def evaluate(string)
    puts(string)
    low_pri = ['+','-']
    hi_pri = ['*','/']
    operators = []
    operands = []
    string.split(' ').each { |x|
      if x =~ /^[0-9]+$/
        #{x} is a digit, pushing to operands"
        operands.push(x.to_i)
      else
        if operators.empty? || low_pri.include?(operators.last) && hi_pri.include?(x)
          #Pushing #{x} because operators are empty OR
          #Pushing #{x} because it is is hipri and the top operator #{operators.last} is low
          operators.push(x)
        else 
          #Evaluating #{operands.last(2)} with #{operators.last}" and pushing the result
          #Then pushing the new operator
          operands << operands.pop(2).inject(operators.pop.to_sym)
          operators.push(x)
        end
      end
    }
    #By now, if any operators are left, they are + or -
    #Evaluate from the bottom of the stacks forward
    while !operators.empty?
      operands.unshift( operands.shift(2).inject(operators.shift.to_sym) )
      puts "--pushing result #{operands.last}"
    end
    #A single operand with no operators is the final answer
    operands.pop
  end
end