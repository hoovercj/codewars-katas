#http://www.codewars.com/kata/text-align-justify/

def justify(text, width)
    arr = Array.new { [] }
    index = 0
    text.split(' ').each do |w|
      index += 1 if arr[index] && arr[index].join(' ').length + w.length + 1 > width
      (arr[index] ||= []) << w
    end

    body = arr[0..-2].map{ |line|
      num_spaces = width - line.join.length.to_f
      num_words = line.length - 1
      line.inject(''){ |l, w|
        if num_words == 0
          "#{l}#{w}"
        else 
          these_spaces = (num_spaces / num_words).ceil          
          num_words -= 1
          num_spaces -= these_spaces
          "#{l}#{w}#{' ' * these_spaces}"
        end
      }
    }.join("\n")
    body.empty? ? arr.last.join(' ') : "#{body}\n#{arr.last.join(' ')}" 
end