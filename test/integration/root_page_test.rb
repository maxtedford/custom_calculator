require 'test_helper'

class RootPageTest < ActionDispatch::IntegrationTest
  test 'root markup' do
    visit root_path
    assert page.has_content? 'Calculator'
    assert page.has_content? 'Enter operation'
    assert page.has_field? 'operation'
    assert page.has_button? 'Calculate'
  end

  test 'submitting a calculation' do
    visit root_path
    fill_in 'operation', with: '1+1'
    click_button 'Calculate'
    assert page.has_content? '1+1'
    assert page.has_content? '2'
  end
end
