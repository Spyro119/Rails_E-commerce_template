require "application_system_test_case"

class SizeColorsTest < ApplicationSystemTestCase
  setup do
    @size_color = size_colors(:one)
  end

  test "visiting the index" do
    visit size_colors_url
    assert_selector "h1", text: "Size Colors"
  end

  test "creating a Size color" do
    visit size_colors_url
    click_on "New Size Color"

    click_on "Create Size color"

    assert_text "Size color was successfully created"
    click_on "Back"
  end

  test "updating a Size color" do
    visit size_colors_url
    click_on "Edit", match: :first

    click_on "Update Size color"

    assert_text "Size color was successfully updated"
    click_on "Back"
  end

  test "destroying a Size color" do
    visit size_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Size color was successfully destroyed"
  end
end
