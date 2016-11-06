class Admin::ServersController < ApplicationController
  before_action :require_admin

  def edit
    @admin = Server.find(params[:id])
    unless session[:server_id] == @admin.id
      flash[:notice] = "You do not have access to this account!"
      if Server.find(session[:server_id]).admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    end
  end

  def update
    @admin = Server.find(params[:id])
    @admin.update(admin_server_params)
    if @admin.save
      flash[:success] = "Your account data has been updated!"
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

private

  def require_admin
    render file: '/public/404' unless current_admin?
  end

  def admin_server_params
    params.require(:server).permit(:name, :username, :password, :password_confirmation)
  end
end
