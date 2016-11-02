class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories, :set_order

  def set_order
    @order = Order.new(session[:order])
  end

  def set_categories
    @categories = Category.all
  end
end
