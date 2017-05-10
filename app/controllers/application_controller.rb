class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :search
  before_filter :set_search

  def destroy_this(a)
    to_be_destroyed = a
    to_be_destroyed.destroy
  end
  helper_method :destroy_this

  def calculate_seconds(time)
    @now_time = Time.now
    @object_time = time.created_at
    @seconds = (@now_time.minus_with_coercion(@object_time)).round
    return @seconds
  end
  helper_method :calculate_seconds



  def set_search
    @search = Post.search(params[:q])
    @posts = @search.result(distinct: true)
  end

  def admin_authentication
    if logged_in?
      redirect_to :back unless current_user.admin
    else
      redirect_to :back
    end
  end
end
