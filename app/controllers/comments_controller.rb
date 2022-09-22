class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]

        if @comment.save
            flash[:success] = "Comment uploaded"
            redirect_to "/recipes/#{@comment.recipe_id}"
        else
            render '/recipes/comment_upload_error'
        end
    end
    private
        def comment_params
            params.require(:comment).permit(:content, :recipe_id)
        end
end
