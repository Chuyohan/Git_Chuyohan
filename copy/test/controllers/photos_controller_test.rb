require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  test "should get album_id:integer" do
    get :album_id:integer
    assert_response :success
  end

  test "should get image:string" do
    get :image:string
    assert_response :success
  end

end
