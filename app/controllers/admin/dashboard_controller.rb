class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @admin = Server.find(session[:server_id])
    @servers = Server.all
    @orders = Order.all
    @order = Order.new
    @items = Item.all
    @status = params[:order][:status] if params[:order]
    params[:order] ?  @status_order = Order.where(status: @status) : @status_order = @orders
    # @orders_with_status = Order.where(status: @status) if params[:order]

  end

private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
