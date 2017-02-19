class CommentsController < ApplicationController
  

  def create
    @comment = Comment.new(comment_params)
    @story = Story.find_by(id: @comment.story_id)
    @comment.user_id == current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @story }
        format.js {}
      end
    else
      flash[:notice] = "Check the comment form, something went wrong."
      render root_path
    end
  end

  def destroy
  @comment = Comment.find(params[:id])
   @story = Story.find_by_id(@comment.story_id)
   
    @comment.destroy
    respond_to do |format|
        flash[:notice] = 'Comment deleted.'
        format.html {redirect_to @story}
        format.js {}
    end 
  end

  private

  def comment_params  
    params.require(:comment).permit(:content,:user_id, :story_id)
  end

end
