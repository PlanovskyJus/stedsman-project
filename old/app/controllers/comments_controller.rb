class CommentsController < ApplicationController
  include SessionsHelper
  before_action :current_user, only: [:create, :destroy]

  def index
    @comment = Comment.all
  end

  def create
    @post = Post.find(comment_params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id #or whatever is you session name
    @comment.author = current_user.name
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "Comments must be at least 15 characters long"
    end
  end

  def show
    # @comment = Comment.find(params[:id])
    @comment = Comment.all
    if logged_in?
      @admin = current_user.admin?
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :user_id, :post_id, :content, :author)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # # Confirms the correct user.
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user)
  # end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
