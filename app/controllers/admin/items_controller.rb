class Admin::ItemsController < ApplicationController
  before_action :require_admin

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:success] = "Item has been updated!"
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

private

    def require_admin
      render file: '/public/404' unless current_admin?
    end

    def item_params
      params.require(:item).permit(:name, :avatar, :price)
    end

end
