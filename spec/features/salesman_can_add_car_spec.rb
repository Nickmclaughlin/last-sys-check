require 'rails_helper'

feature "user can create a new car" do
  before :each do
    @car = FactoryGirl.create(:car)

    visit root_path
    click_on @car.manufacturer.name
  end

  scenario "with required attributes" do
    fill_in("Color", with: @car.color)
    fill_in("Year", with: @car.year)
    fill_in("Mileage", with: @car.mileage)

    click_on "Create Car"

    expect(page).to have_content("You successfully created a car.")
  end

  scenario "without required attributes" do
    click_on "Create Car"

    expect(page).to have_content("prohibited")
  end
end
