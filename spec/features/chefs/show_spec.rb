require "rails_helper"

RSpec.describe "chef show page" do
  before(:each) do
    @chef = Chef.create({name: "Meg"})
    @dish_1 = @chef.dishes.create({name: "Alfredo", description: "Creamy white sauce"})
    @dish_2 = @chef.dishes.create({name: "Pizza", description: "Yummy"})
    @dish_3 = @chef.dishes.create({name: "Butter Noodles", description: "Spicy"})
    @ingredient_1 = Ingredient.create({name: "cream cheese", calories: "120"})
    @ingredient_2 = Ingredient.create({name: "milk", calories: "50"})
    @ingredient_3 = Ingredient.create({name: "parmesian cheese", calories: "250"})
    @ingredient_4 = Ingredient.create({name: "dough", calories: "200"})
    @ingredient_5 = Ingredient.create({name: "tomato sauce", calories: "100"})
    @ingredient_6 = Ingredient.create({name: "pasta", calories: "80"})

    @dish_1.ingredients << @ingredient_1
    @dish_1.ingredients << @ingredient_2
    @dish_1.ingredients << @ingredient_3
    @dish_1.ingredients << @ingredient_6

    @dish_2.ingredients << @ingredient_3
    @dish_2.ingredients << @ingredient_4
    @dish_2.ingredients << @ingredient_5
    @dish_2.ingredients << @ingredient_6

    @dish_3.ingredients << @ingredient_6
  end

  it "can see name of chef, and link to view all ingredients this chef uses" do

    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to have_link("All Ingredients")

    click_link("All Ingredients")
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

    expect(page).to have_content("All Ingredients:")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_5.name)
  end
end
