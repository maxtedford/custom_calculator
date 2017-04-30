require 'test_helper'
require 'poros/custom_calculator'

class CustomCalculatorTest < ActiveSupport::TestCase
  def setup
    @calculation = '5*3+1+6/2+9*100'
  end

  test 'it can return its original calculation' do
    calculator = CustomCalculator.new('1+1')
    calculator.calculation.must_equal '1+1'
  end

  test 'it can parse the calculation to an array sequence' do
    calculator = CustomCalculator.new(@calculation)
    expected_sequence = ["5", "*", "3", "+", "1", "+", "6", "/", "2", "+", "9", "*", "100"]
    assert_equal expected_sequence, calculator.to_sequence
  end

  test 'it multiplies and divides first' do
    calculator = CustomCalculator.new(@calculation)
    assert_equal [15.0, "+", "1", "+", 3.0, "+", 900.0], calculator.run_multiplactors
  end
end
