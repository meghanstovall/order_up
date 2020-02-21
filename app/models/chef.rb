class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    dishes.joins(:ingredients).distinct.pluck('ingredients.name')
    
    # ingredients = dishes.map do |dish|
    #   dish.ingredients
    # end.flatten
  end
end
