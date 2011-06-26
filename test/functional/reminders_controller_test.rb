require 'test_helper'

class RemindersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
