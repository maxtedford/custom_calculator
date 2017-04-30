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
end
