class OrdersController < ApplicationController

  def index

  end


  def create
    item = Item.find(params[:item_id])
    @order.add_item(item.id)
    session[:order] = @order.contents
    flash[:notice] = "Item added to order"
    redirect_to category_name_path(item.category.name)
  end


  def destroy
    @order.delete(params[:format])
    redirect_to orders_path
  end

  def update
    item_id = params[:item_id]
    quantity = params[:quantity]

    @order.update_quantity(item_id, quantity)
    redirect_to orders_path
  end
end
