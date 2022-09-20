class RecipesController < ApplicationController
    include SessionsHelper
    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = session[:user_id]
        if recipe_params[:cover_image].nil?
            @recipe.cover_image.attach(io: File.open("#{Rails.root}/app/assets/images/kitten.jpg"), filename: 'kitten.jpg', content_type: 'image/jpg')
        end

        if @recipe.save
            flash[:success] = "Recipe uploaded"
            redirect_to '/home'
        else
            render '/recipes/error'
        end
    end


    def show 
        @recipe = Recipe.find(params[:id])
        @user = User.find_by(id: [@recipe.user_id])
    end

    private #helper functions only for METHODS within the class (.method.private_method)
      def recipe_params
        params.require(:recipe).permit(:title,:cover_image, :ingredients, :instructions)
      end
    
end
