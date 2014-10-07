require 'rails_helper'

feature "user can create a new manufacturer" do
  before :each do
    visit root_path
    click_on "Submit New Manufacturer"
  end

  scenario "with required attributes" do
    manufacturer = FactoryGirl.build(:manufacturer)

    fill_in("Name", with: manufacturer.name)
    fill_in("Country", with: manufacturer.country)

    click_on("Create Manufacturer")

    expect(page).to have_content("You successfully created a manufacturer.")
  end

  scenario "without required attributes" do
    click_on("Create Manufacturer")

    expect(page).to have_content("prohibited")
  end

  scenario "enters an invalid year" do
    # test for entering a year below 1920
  end
end
