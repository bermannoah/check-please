class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @admin = Server.find(session[:server_id])
  end

  def update
    @admin = Server.find(params[:id])
    if @admin.save
      flash[:success] = "Your account data has been updated!"
      redirect_to admin_dashboard_path(@admin)
    else
      render :edit
    end
  end


  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
