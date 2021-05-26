require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @produit = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Produit" do
    visit products_url
    click_on "New product"

    click_on "Create product"

    assert_text "product was successfully created"
    click_on "Back"
  end

  test "updating a product" do
    visit products_url
    click_on "Edit", match: :first

    click_on "Update product"

    assert_text "product was successfully updated"
    click_on "Back"
  end

  test "destroying a product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "product was successfully destroyed"
  end
end
