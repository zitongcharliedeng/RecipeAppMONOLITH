module RecipesHelper
     def average_rating(recipe)
            array_of_recipe_ratings = []
            for rating in Rating.where(recipe_id: recipe.id) do
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
