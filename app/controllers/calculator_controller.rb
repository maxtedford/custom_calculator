class CalculatorController < ApplicationController
  def index
  end

  def create
    @operation = params[:operation]
    calculator = Poros::CustomCalculator.new(@operation)
    @result = calculator.calculate
    render :index
  end
end
