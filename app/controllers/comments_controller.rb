class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.recipe_id = 1

        if @comment.save
            flash[:success] = "Comment uploaded"
        else
            render '/recipes/comment_upload_error'
        end
    end
    private
        def comment_params
            params.require(:comment).permit(:content)
        end
end
