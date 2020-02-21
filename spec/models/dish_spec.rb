require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "#total_calories" do
    it "can calculate total calories" do
      chef = Chef.create({name: "Meg"})
      dish = chef.dishes.create({name: "Alfredo", description: "Creamy white sauce"})
      ingredient_1 = Ingredient.create({name: "cream cheese", calories: "120"})
      ingredient_2 = Ingredient.create({name: "milk", calories: "50"})
      ingredient_3 = Ingredient.create({name: "parmesian cheese", calories: "250"})

      dish.ingredients << ingredient_1
      dish.ingredients << ingredient_2
      dish.ingredients << ingredient_3

      expect(dish.total_calories).to eq(420)
    end
  end
end
