class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_prams)
    
    if @comment.save
      redirect_to [@image.gallery, @image]
    else
      @gallery = @image.gallery
      render "images/show"
    end
  end

  def comment_prams
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end

