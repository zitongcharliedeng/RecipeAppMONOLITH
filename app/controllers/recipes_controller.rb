class RecipesController < ApplicationController
    include SessionsHelper
    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = session[:user_id]
        

        if @recipe.save
            flash[:success] = "Recipe uploaded"
            redirect_to '/home'
        else
            render '/recipes/error'
        end
    end


    def show
    end

    private #helper functions only for METHODS within the class (.method.private_method)
      def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions)
      end
    
end
