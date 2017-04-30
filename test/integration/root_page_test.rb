require 'test_helper'

class RootPageTest < ActionDispatch::IntegrationTest
  test 'root page' do
    visit root_path
    assert page.has_content? 'Calculator'
    assert page.has_content? 'Enter operation'
    assert page.has_field? 'operation'
    assert page.has_button? 'Calculate'
  end
end
