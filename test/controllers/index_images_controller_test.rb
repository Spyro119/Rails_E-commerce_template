require 'test_helper'

class IndexImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @index_image = index_images(:one)
  end

  test "should get index" do
    get index_images_url
    assert_response :success
  end

  test "should get new" do
    get new_index_image_url
    assert_response :success
  end

  test "should create index_image" do
    assert_difference('IndexImage.count') do
      post index_images_url, params: { index_image: {  } }
    end

    assert_redirected_to index_image_url(IndexImage.last)
  end

  test "should show index_image" do
    get index_image_url(@index_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_index_image_url(@index_image)
    assert_response :success
  end

  test "should update index_image" do
    patch index_image_url(@index_image), params: { index_image: {  } }
    assert_redirected_to index_image_url(@index_image)
  end

  test "should destroy index_image" do
    assert_difference('IndexImage.count', -1) do
      delete index_image_url(@index_image)
    end

    assert_redirected_to index_images_url
  end
end
