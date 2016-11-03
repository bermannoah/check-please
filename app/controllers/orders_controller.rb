class OrdersController < ApplicationController
  def create
    items_and_quantity = session[:ticket]
    order = Order.create()
  end


  private

  def user_id
    params.permit(:user_id)[:user_id].to_i
  end

  def item_ids_and_quantity
    items_and_quantity = session[:ticket]
  end

  def create_order_items

  end
end
