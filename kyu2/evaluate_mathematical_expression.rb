#http://www.codewars.com/kata/evaluate-mathematical-expression/

# NOTE: This implementation has a lot of room for improvement
def calc expression
  puts(expression)
  puts '****'
  low_pri = ['+','-']
  hi_pri = ['*','/']
  operators = []
  operands = []
  parse(expression).each { |x|
    if x.is_a? Numeric
      # "#{x} is a digit, pushing to operands"
      operands.push(x)
    elsif x == ')'
      # "Evaluating many because of #{x}"
      evaluate_many!(operators, operands)
    elsif x == '(' || operators.last == '('
      # "pushing #{x} to operators"
      operators.push(x)      
    elsif operands.length < 2 || (hi_pri.include?(x) && low_pri.include?(operators.last))
      # "#Pushing #{x} because operators are empty" if operators.empty?
      # "#Pushing #{x} because it is is hipri and the top operator #{operators.last} is low" if low_pri.include?(operators.last) && hi_pri.include?(x)
      operators.push(x)
    else
      # "Evaluate one"
      evaluate_one!(operators, operands)
      operators.push(x)
    end
  }
  # "Evaluating all because the expression has been parsed"
  evaluate_many!(operators, operands) while !operators.empty?
  operands.pop
end

def evaluate_one!(operators, operands)
  # "Eval1- operands: #{operands.join(' ')}, operators: #{operators.join(' ')}"
  # "Pushing result of #{operands.last(2).inject(operators.last.to_sym)} to operands"
  operands << operands.pop(2).inject(operators.pop.to_sym)
end

def evaluate_many!(operators, operands)
  while operators.length > 0 && operators.last != '('
    evaluate_one!(operators, operands)
  end
  operators.pop if operators.last == '('
end

def parse string
  expression = []
  number = []
  # Find negations and replace them with  (-1 * #{original})
  regex = /([^0-9\)]|^)((-)(\([^\)]*\)))/
  string = string.gsub(/\s+/, "").gsub(/--/,"+")
  while string =~ regex
    match = string.match(regex)
    string.gsub!(regex, "#{match[1]}(-1*#{match[4]})")
  end
  string.chars.each { |c|
    if(is_num?(c)) 
      # "Pushing #{c} to number"
      number << c 
    else
      if !number.empty?
        # "Received symbol and number is not empty, converting #{number.join} to f"
        expression << number.join.to_f 
        number = []
        expression << c
      elsif c == '-' && expression.last != ')'
        # "Number is empty and c is a negation, pushing to number"
        number << c
      else
        # "Number is empty and c is #{c}, pushing to expression"
        expression << c
      end
    end
  }
  expression << number.join.to_f if !number.empty?
  puts expression.join(' ')
  expression
end

def is_num? n
  n =~ /^[0-9.]+$/
end