class Dose < ApplicationRecord
   # validates :name, uniqueness: { scope: :name }
   validates :cocktail_id, uniqueness: { scope: :ingredient_id }
    validates :description, presence: true  
    belongs_to :cocktail
    belongs_to :ingredient
end
