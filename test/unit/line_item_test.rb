require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, :service_id =>  FactoryGirl.create(:service)
    end
  end
end
