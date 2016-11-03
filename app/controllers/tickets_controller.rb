class TicketsController < ApplicationController

  def index

  end


  def create
    item = Item.find(params[:item_id])
    @ticket.add_item(item.id)
    session[:ticket] = @ticket.contents
    redirect_to category_name_path(item.category.name)
  end


  def destroy
    @ticket.delete(params[:format])
    redirect_to tickets_path
  end

  def update
    item_id = params[:item_id]
    quantity = params[:quantity]

    @ticket.update_quantity(item_id, quantity)
    redirect_to tickets_path
  end
end
