class OrdersController < ApplicationController
  before_action :require_log_in

  def index
    @server = Server.find(session[:server_id])
    @orders = @server.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    server = Server.find(server_id)
    order = Order.new(server_id: server.id, total: @ticket.total )
    if order.save
      create_order_items(order.id)
      redirect_to orders_path
    else
      redirect_to dashboard_path
    end
  end


  private

  def server_id
    params.permit(:server_id)[:server_id].to_i
  end

  def create_order_items(order_id)
    @ticket.create_order_items(order_id)
  end

  def require_log_in
    render file: '/public/404' unless logged_in?
  end
end
