require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  test "should get clubs" do
    get :clubs
    assert_response :success
  end

  test "should get clubs_category" do
    get :clubs_category
    assert_response :success
  end

  test "should get club_view" do
    get :club_view
    assert_response :success
  end

end
