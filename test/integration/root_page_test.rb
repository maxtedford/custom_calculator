require 'test_helper'

class RootPageTest < ActionDispatch::IntegrationTest
  test 'root page' do
    visit root_path
    assert page.has_content? 'Calculator'
  end
end
