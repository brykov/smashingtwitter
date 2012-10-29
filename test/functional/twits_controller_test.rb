require 'test_helper'

class TwitsControllerTest < ActionController::TestCase
  setup do
    @twit = twits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twits)
  end


end
