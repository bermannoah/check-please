class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories, :set_order

  def current_user
    @current_user ||= Server.find(session[:server_id]) if session[:server_id]
  end

  helper_method :current_user
  
  def set_order
    @order = Order.new(session[:order])
  end

  def set_categories
    @categories = Category.all
  end
end
