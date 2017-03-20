class PostsController < ApplicationController
  include SessionsHelper
  before_action :admin_user, only: [:destroy, :create]
  skip_before_filter :verify_authenticity_token
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end

    if logged_in?
      @admin = current_user.admin?
    end
    if logged_in?
      @logged_in_user = logged_in_user
    end
  end

  def create
    @post = Post.new(post_params)
      if @post.save
          redirect_to root_path
      else
        flash[:danger] = "Yup, it didn't work hun"
      end # if save
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])

    if logged_in?
      @logged_in_user = logged_in_user
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :all_tags, :avatar)
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
