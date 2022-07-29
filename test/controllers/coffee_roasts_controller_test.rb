require "test_helper"

class CoffeeRoastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_roast = coffee_roasts(:one)
  end

  test "should get index" do
    get coffee_roasts_url, as: :json
    assert_response :success
  end

  test "should create coffee_roast" do
    assert_difference('CoffeeRoast.count') do
      post coffee_roasts_url, params: { coffee_roast: { roast_description: @coffee_roast.roast_description, roast_name: @coffee_roast.roast_name } }, as: :json
    end

    assert_response 201
  end

  test "should show coffee_roast" do
    get coffee_roast_url(@coffee_roast), as: :json
    assert_response :success
  end

  test "should update coffee_roast" do
    patch coffee_roast_url(@coffee_roast), params: { coffee_roast: { roast_description: @coffee_roast.roast_description, roast_name: @coffee_roast.roast_name } }, as: :json
    assert_response 200
  end

  test "should destroy coffee_roast" do
    assert_difference('CoffeeRoast.count', -1) do
      delete coffee_roast_url(@coffee_roast), as: :json
    end

    assert_response 204
  end
end
