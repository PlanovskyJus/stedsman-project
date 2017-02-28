module CommentsHelper
  def comment
    @comment = Comment.find(params[:id])
  end
end
