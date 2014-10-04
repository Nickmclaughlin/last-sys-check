require 'rails_helper'

feature "user can create a new car" do
  scenario "visits root path clicks on specific manufacturer fills create car form" do
    car = FactoryGirl.create(:car)

    visit root_path

    click_on car.manufacturer.name

    fill_in("Color", with: car.color)
    fill_in("Year", with: car.year)
    fill_in("Mileage", with: car.mileage)

    click_on "Create Car"

    expect(page).to have_content("You successfully created a car.")
  end

  scenario "visits root path clicks on specific manufacturer fills out form incorrectly" do
    car = FactoryGirl.create(:car)

    visit root_path

    click_on car.manufacturer.name

    click_on "Create Car"

    expect(page).to have_content("prohibited")
  end
end
