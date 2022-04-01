require 'test_helper'

class TurboDeviseControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get turbo_devise_index_url
    assert_response :success
  end
end
