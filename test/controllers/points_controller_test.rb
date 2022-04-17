require "test_helper"

class PointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point = points(:one)
  end

  test "should get index" do
    get points_url
    assert_response :success
  end

  test "should get new" do
    get new_point_url
    assert_response :success
  end

  test "should create point" do
    assert_difference('Point.count') do
      post points_url, params: { point: { fund_event: @point.fund_event, gen_event: @point.gen_event, prof_referrals: @point.prof_referrals, referrals: @point.referrals, vol_event: @point.vol_event } }
    end

    assert_redirected_to point_url(Point.last)
  end

  test "should show point" do
    get point_url(@point)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_url(@point)
    assert_response :success
  end

  test "should update point" do
    patch point_url(@point), params: { point: { fund_event: @point.fund_event, gen_event: @point.gen_event, prof_referrals: @point.prof_referrals, referrals: @point.referrals, vol_event: @point.vol_event } }
    assert_redirected_to point_url(@point)
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete point_url(@point)
    end

    assert_redirected_to points_url
  end
end
