require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  test "should get foodViewed" do
    get :foodViewed
    assert_response :success
  end

end
