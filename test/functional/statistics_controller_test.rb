require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should assign range" do
    get :index, range: "today"
    assert_not_nil assigns(:range)
  end
end
