class RatingsController < ApplicationController
    def create
        @rating = Rating.new(rating_params)
        @rating.user_id = session[:user_id]

        if @rating.save
            flash[:success] = "Rating uploaded"
            redirect_to "/recipes/#{@rating.recipe_id}"
        else
            render '/ratings/rating_upload_error'
        end
    end

    def update
        Rating.find(params[:id]).update(rating: rating_params[:rating])
        redirect_to "/recipes/#{rating_params[:recipe_id]}"
    end

    private
        def rating_params
            params.require(:rating).permit(:rating, :recipe_id)
        end

end
