class PostCommentsController < ApplicationController
    def create
        @post_comment = PostComment.new(post_comment_params)
        @post_comments = PostComment.all
        @post_comment.user_id = current_user.id
        # binding.pry
        @dog = Dog.find(params[:dog_id])
        @post_comment.dog_id = @dog.id
        if @post_comment.save
            @post_comment = PostComment.new
        end
    end
    def destroy
        @dog = Dog.find(params[:dog_id])
        @post_comment = PostComment.find_by(id: params[:id], dog_id: params[:dog_id])
        @post_comment.destroy
    end
    private
    def post_comment_params
      params.require(:post_comment).permit(:comment, :dog_id, :user_id)
    end
end
