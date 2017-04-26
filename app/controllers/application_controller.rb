class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :search
  before_filter :set_search

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
