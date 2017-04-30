require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should post to create' do
    post calculator_index_path, params: { operation: '1+1' }
    assert_current_path root_path
  end
end
