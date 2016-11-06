class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @admin = Server.find(session[:server_id])
    @servers = Server.all
    @orders = Order.all
    @items = Item.all
  end

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
