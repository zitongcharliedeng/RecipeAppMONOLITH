class Recipe < ApplicationRecord
    belongs_to :user
    has_one_attached :cover_image
    has_many :comments,  dependent: :destroy
    has_many :ratings,  dependent: :destroy
    def average_rating
        array_of_recipe_ratings = []
        for rating in Rating.where(recipe_id: self.id) do
            array_of_recipe_ratings << rating.rating
        end

        total = 0.00
    
        for rating in array_of_recipe_ratings do
            total += rating.to_f
        end

        average_rating = (total / (array_of_recipe_ratings.length)).round(2)
        return average_rating
    end
end
