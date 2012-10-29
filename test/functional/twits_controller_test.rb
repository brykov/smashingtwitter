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

  test "should show twit" do
    get :show, id: @twit
    assert_response :success
  end

end
