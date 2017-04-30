require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should post to create' do
    post calculator_index_path, params: { operation: '5*3+1+6/2+9*100' }
    assert_redirected_to root_path
  end
end
