require "rails_helper"

RSpec.describe "dish show page" do
  before(:each) do
    @chef = Chef.create({name: "Meg"})
    @dish = @chef.dishes.create({name: "Alfredo", description: "Creamy white sauce"})
    @ingredient_1 = Ingredient.create({name: "cream cheese", calories: "120"})
    @ingredient_2 = Ingredient.create({name: "milk", calories: "50"})
    @ingredient_3 = Ingredient.create({name: "parmesian cheese", calories: "250"})

    @dish.ingredients << @ingredient_1
    @dish.ingredients << @ingredient_2
    @dish.ingredients << @ingredient_3
  end

  it "can see name of cheif and a list of ingredients" do

    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content("Chef: #{@chef.name}")
    expect(page).to have_content("Ingredients:")

    within "#ingredients-list" do
      expect(page).to have_content("#{@ingredient_1.name}: #{@ingredient_1.calories} calories")
      expect(page).to have_content("#{@ingredient_2.name}: #{@ingredient_2.calories} calories")
      expect(page).to have_content("#{@ingredient_3.name}: #{@ingredient_3.calories} calories")
    end
  end

  it "can see total calorie count of the dish" do

    visit "/dishes/#{@dish.id}"

    expect(page).to have_content("Total Calories: 420")
  end
end
