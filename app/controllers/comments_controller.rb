class CommentsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  before_action :admin_user, only: [:create, :destroy, :update, :index]

  def index
    @comment = Comment.all
    if logged_in?
      @admin = current_user.admin?
    end
    if logged_in?
      @correct_user = correct_user
    end
  end

  def create
    puts "something herer"
    puts params
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
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path
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

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
