require 'test_helper'

class SizeColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @size_color = size_colors(:one)
  end

  test "should get index" do
    get size_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_size_color_url
    assert_response :success
  end

  test "should create size_color" do
    assert_difference('SizeColor.count') do
      post size_colors_url, params: { size_color: {  } }
    end

    assert_redirected_to size_color_url(SizeColor.last)
  end

  test "should show size_color" do
    get size_color_url(@size_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_size_color_url(@size_color)
    assert_response :success
  end

  test "should update size_color" do
    patch size_color_url(@size_color), params: { size_color: {  } }
    assert_redirected_to size_color_url(@size_color)
  end

  test "should destroy size_color" do
    assert_difference('SizeColor.count', -1) do
      delete size_color_url(@size_color)
    end

    assert_redirected_to size_colors_url
  end
end
