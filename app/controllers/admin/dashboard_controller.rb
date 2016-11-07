class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @admin = Server.find(session[:server_id])
    @servers = Server.all
    @orders = Order.all
    @order = Order.new
    @items = Item.all
  end

private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
