require "application_system_test_case"

class BagmonsTest < ApplicationSystemTestCase
  setup do
    @bagmon = bagmons(:one)
  end

  test "visiting the index" do
    visit bagmons_url
    assert_selector "h1", text: "Bagmons"
  end

  test "creating a Bagmon" do
    visit bagmons_url
    click_on "New Bagmon"

    fill_in "Image", with: @bagmon.image
    fill_in "Name", with: @bagmon.name
    fill_in "Number", with: @bagmon.number
    fill_in "Type", with: @bagmon.type_id
    click_on "Create Bagmon"

    assert_text "Bagmon was successfully created"
    click_on "Back"
  end

  test "updating a Bagmon" do
    visit bagmons_url
    click_on "Edit", match: :first

    fill_in "Image", with: @bagmon.image
    fill_in "Name", with: @bagmon.name
    fill_in "Number", with: @bagmon.number
    fill_in "Type", with: @bagmon.type_id
    click_on "Update Bagmon"

    assert_text "Bagmon was successfully updated"
    click_on "Back"
  end

  test "destroying a Bagmon" do
    visit bagmons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bagmon was successfully destroyed"
  end
end
