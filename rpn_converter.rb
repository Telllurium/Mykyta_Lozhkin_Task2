# frozen_string_literal: true

def infix_to_rpn(expression)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }
  output = []
  stack = []

  tokens = expression.split

  tokens.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token.match?(/[+\-*\/]/)
      while stack.any? && precedence[stack.last] >= precedence[token]
        output << stack.pop
      end
      stack << token
    elsif token == '('
      stack << token
    elsif token == ')'
      output << stack.pop while stack.last != '('
      stack.pop
    end
  end

  output.concat(stack.reverse)
end

puts "Введіть математичний вираз у звичному форматі:"
expression = gets.chomp

output_expression = infix_to_rpn(expression)
puts "Результат у зворотній польській нотації: #{output_expression.join(' ')}"