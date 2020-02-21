require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "#ingredients" do
    it "can return array of chefs ingredients" do
      chef = Chef.create({name: "Meg"})
      dish_1 = chef.dishes.create({name: "Alfredo", description: "Creamy white sauce"})

      ingredient_1 = Ingredient.create({name: "cream cheese", calories: "120"})
      ingredient_2 = Ingredient.create({name: "milk", calories: "50"})

      dish_1.ingredients << ingredient_1
      dish_1.ingredients << ingredient_2

      expect(chef.ingredients).to eq([ingredient_1, ingredient_2])
    end
  end
end
