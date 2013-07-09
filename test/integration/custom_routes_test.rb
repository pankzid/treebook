require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "that /login route should opens login page" do 
  	get 'login'
  	assert_response :success
  end

  test "that /logout route should opens log out page" do 
  	get 'logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that /register route should opens sign up page" do 
  	get 'register'
  	assert_response :success
  end

  test "should open the profile_name by id" do 
    get '/kinaldevi'
    assert_response :success
  end
end
