class RecipesController < ApplicationController
    include SessionsHelper
    include RecipesHelper
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

        @current_rating = Rating.find_by(recipe_id: @recipe.id , user_id: @user.id )

        
        @average_rating = average_rating(@recipe)
    end

    def index
        @rating_ordered_recipes = []
        @hash_of_ratings_and_their_recipe = {}
        for recipe in Recipe.all
            @hash_of_ratings_and_their_recipe[recipe.id] = average_rating(recipe)
        end
        @rating_ordered_recipes_hash = @hash_of_ratings_and_their_recipe.sort_by{|k,v| v*(-1)}
        for k,v in @rating_ordered_recipes_hash
            @rating_ordered_recipes << Recipe.find_by(id: k)
        end
    end
    
    private #helper functions only for METHODS within the class (.method.private_method)
      def recipe_params
        params.require(:recipe).permit(:title,:cover_image, :ingredients, :instructions)
      end

end
