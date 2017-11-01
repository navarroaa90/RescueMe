class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.pet_id = params[:pet_id]
        @comment.save
        redirect_to pet_path(params[:pet_id])
    end
    def destroy
        comment = Comment.find(params[:id])
        pet = comment.pet
        @comment.destroy
        redirect_to pet_path(pet)
    end
    private

    def comment_params
        params.require(:comment).permit(:remark)
    end
end
