class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @new_comment = Comment.new(comment_params)

    if @new_comment.save
      if request.xhr?
        render json: @new_comment
        flash[:notice] = "Thank You for Commenting!"
      end
    else
      [404,'Err']
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    video = Video.find_by(id: comment.video_id)
    concert = video.concert_id
    if comment.update(comment_params)
     redirect_to concert_path(concert)
   else
    [404, "The Page cannot be retrived"]
  end
end

def destroy
  comment = Comment.find(params[:id])
  video = Video.find_by(id: comment.video_id)
  concert = video.concert_id
  comment.destroy
  respond_to do |format|
    format.html { redirect_to concert_path(concert), notice: 'The Comment was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
def comment_params
  params.require(:comment).permit(:content, :video_id, :user_id)
end
end