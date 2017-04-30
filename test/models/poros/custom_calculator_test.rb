require 'test_helper'
require 'poros/custom_calculator'

class CustomCalculatorTest < ActiveSupport::TestCase
  def setup
    @integer_sequence = '5*3+1+6/2+9*100'
    @float_sequence = '5*3+1+6/85+9*100'
  end

  test 'it can return its original calculation' do
    calculator = CustomCalculator.new('1+1')
    calculator.calculation.must_equal '1+1'
  end

  test 'it can parse the calculation to an array sequence' do
    calculator = CustomCalculator.new(@integer_sequence)
    expected_sequence = ["5", "*", "3", "+", "1", "+", "6", "/", "2", "+", "9", "*", "100"]
    assert_equal expected_sequence, calculator.to_sequence
  end

  test 'it multiplies and divides first' do
    calculator = CustomCalculator.new(@integer_sequence)
    assert_equal [15.0, "+", "1", "+", 3.0, "+", 900.0], calculator.run_multiplactors
  end

  test 'it runs addition and subtraction second' do
    calculator = CustomCalculator.new(@integer_sequence)
    first_run_result = calculator.run_multiplactors
    assert_equal 919, calculator.evaluate
  end

  test 'it can return the final result as an integer' do
    calculator = CustomCalculator.new(@integer_sequence)
    assert_equal 919, calculator.calculate
  end

  test 'it can return the final result as a float' do
    calculator = CustomCalculator.new(@float_sequence)
    assert_equal Float, calculator.calculate.class
  end

  test 'the float returned is rounded to the second place' do
    calculator = CustomCalculator.new(@float_sequence)
    assert_equal 916.07, calculator.calculate
  end
end
