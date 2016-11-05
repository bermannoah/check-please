class CategoriesController < ApplicationController
  
  def index
      @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:category_name].titleize)
    @items = @category.items
  end
  
end
