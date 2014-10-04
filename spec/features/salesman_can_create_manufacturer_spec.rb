require 'rails_helper'

feature "user can create a new manufacturer" do
  scenario "visits root path sees link to submit new manufacturer and submits" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit root_path
    click_on "Submit New Manufacturer"

    fill_in("Name", with: manufacturer.name)
    fill_in("Country", with: manufacturer.country)

    click_on("Create Manufacturer")

    expect(page).to have_content("You successfully created a manufacturer.")
  end

  scenario "submits incorrect infomation receives error message" do
    visit root_path
    click_on "Submit New Manufacturer"

    click_on("Create Manufacturer")

    expect(page).to have_content("prohibited")
  end
end
