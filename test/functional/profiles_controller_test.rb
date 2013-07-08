require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  test "should get show" do
    get :show, id: users(:kinal).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render 404/not found if profile_name isn't exist" do 
  	get :show, id: 'doesn\'t exist'
  	assert_response :not_found
  end

  test "should assign user object if profile_name exist" do 
  	get :show, id: users(:kinal2).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "should only own statuses" do 
  	get :show, id: users(:kinal).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:kinal), status.user
  	end

  end
end
