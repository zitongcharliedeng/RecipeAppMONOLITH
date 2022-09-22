class Rating < ApplicationRecord
    
    belongs_to :user
    belongs_to :recipe

    validates :rating, inclusion: 0..5

    validates :user_id, uniqueness: { scope: :recipe_id }

end
