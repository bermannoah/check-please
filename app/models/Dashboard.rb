class Dashboard
  attr_reader :servers, :orders, :items, :order, :admin, :status_order, :status, :roles, :unique_statuses

  def initialize
    @servers  = Server.all
    @orders   = Order.all
    @items    = Item.all
    @order    = Order.new
    @status_order = set_status_order
    @roles = Server.select("DISTINCT role")
    @unique_statuses = Order.select("DISTINCT status")
  end

  def set_admin(server_id)
    @admin = Server.find(server_id)
  end

  def set_status(order_status)
    @status = order_status
  end

  def set_status_order
    @status ?  @status_order = Order.where(status: @status) : @status_order = orders
  end
end
