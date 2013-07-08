require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "should have content" do 
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "should have content with at least 2 char" do 
  	status = Status.new
  	status.content = 'h'
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "should have user_id" do 
  	status = Status.new
  	status.content = "Hello"
  	# status.user_id = 2
  	assert !status.save
  	# puts status.inspect
  	assert !status.errors[:user_id].empty?
  end
end