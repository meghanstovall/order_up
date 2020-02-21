class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    # id = self.id
    # dishes.joins(:dish_ingredients).where('dish.chef_id = id')
require "pry"; binding.pry
    ingredients = dishes.map do |dish|
      dish.ingredients
    end.flatten
  end
end
