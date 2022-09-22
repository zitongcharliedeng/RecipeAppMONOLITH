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
        @author = User.find_by(id: [@recipe.user_id])
        @user = User.find_by(id: session[:user_id])
        @comment = Comment.new
        @rating = Rating.new

        @current_rating = Rating.all.find_by(recipe_id: @recipe.id , user_id: @user.id )

        
        # finding average rating of a recipe, @average_rating
        @array_of_recipe_ratings = []
        for rating in Rating.all do
            ( @array_of_recipe_ratings << rating.rating ) if rating.recipe_id ==  @recipe.id
        end

        @total = 0.00
    
        for rating in @array_of_recipe_ratings do
            @total += rating.to_f
        end

        @average_rating = (@total / (@array_of_recipe_ratings.length)).round(2)
    end

    private #helper functions only for METHODS within the class (.method.private_method)
      def recipe_params
        params.require(:recipe).permit(:title,:cover_image, :ingredients, :instructions)
      end
end
