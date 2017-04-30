class CalculatorController < ApplicationController
  def index
  end

  def create
    @operation = params[:operation]
    render :index
  end
end
