require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "a user should enter the first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter the last name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter the profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have unique profile name" do 
  	user = User.new
  	user.first_name = 'kinal'
  	user.last_name = 'devi'
  	user.email = 'kinal@kinal.com'
  	user.profile_name = 'kinal'

  	user2 = User.new
  	user2 = users(:kinal)
  	user2.save


  	assert !user.save
		assert !user.errors[:profile_name].empty?  	
  end

  test "a user should have profile name without space" do 
  	user = User.new
  	user.profile_name = users(:kinal).profile_name

  	assert !user.save
		puts user.errors.inspect
  	assert user.errors[:profile_name].include?("Must be formated correctly.")
  end

end
