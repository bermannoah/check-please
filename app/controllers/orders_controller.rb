class OrdersController < ApplicationController
  def create
    items_and_quantity
    binding.pry
  end
end
