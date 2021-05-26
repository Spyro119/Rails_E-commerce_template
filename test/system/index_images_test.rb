require "application_system_test_case"

class IndexImagesTest < ApplicationSystemTestCase
  setup do
    @index_image = index_images(:one)
  end

  test "visiting the index" do
    visit index_images_url
    assert_selector "h1", text: "Index Images"
  end

  test "creating a Index image" do
    visit index_images_url
    click_on "New Index Image"

    click_on "Create Index image"

    assert_text "Index image was successfully created"
    click_on "Back"
  end

  test "updating a Index image" do
    visit index_images_url
    click_on "Edit", match: :first

    click_on "Update Index image"

    assert_text "Index image was successfully updated"
    click_on "Back"
  end

  test "destroying a Index image" do
    visit index_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Index image was successfully destroyed"
  end
end
