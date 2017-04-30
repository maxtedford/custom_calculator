class CustomCalculator
  attr_reader :calculation

  MULTIPLACTOR = /[\/\*]/
  SUBTRADDITION = /[+-]/
  OPERATOR = Regexp.union(MULTIPLACTOR, SUBTRADDITION)
  INTEGER = /\d*/

  def initialize(calculation)
    @calculation = calculation
  end

  def to_sequence
    numerators = calculation.split(OPERATOR)
    operators = calculation.split(INTEGER).reject(&:empty?)
    numerators.zip(operators).flatten.compact
  end

  def run_multiplactors
    sequence = to_sequence
    sequence.each_with_index.inject([]) do |accum, (n, i)|
      if n =~ MULTIPLACTOR && accum.last.is_a?(Float)
        accum << accum.pop.send(n, sequence[i+1].to_f)
      elsif n =~ MULTIPLACTOR
        accum << (sequence[i-1].to_f.send(n, sequence[i+1].to_f))
      elsif n =~ SUBTRADDITION || [sequence[i-1], n, sequence[i+1]].none?{ |n| n =~ MULTIPLACTOR }
        accum << n
      elsif sequence[i-1] =~ SUBTRADDITION && sequence[i+1] =~ SUBTRADDITION
        accum << n.to_f
      end
      accum
    end
  end
end
