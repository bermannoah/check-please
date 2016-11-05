class CategoriesController < ApplicationController
  def index
      @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:category_name].capitalize)
    @items = @category.items
  end
end
