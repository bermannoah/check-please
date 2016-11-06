class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @admin = Server.find(session[:server_id])
  end

  # def edit
  #   @admin = Server.find(session[:server_id])
  # end
  #
  # def update
  #   @admin = Server.find(session[:server_id])
  #   if @admin.update(admin_edit_params)
  #     flash[:success] = "Your account data has been updated!"
  #     redirect_to edit_dashboard_path(@admin)
  #   else
  #     render :edit
  #   end
  # end

private

  def require_admin
    render file: '/public/404' unless current_admin?
  end

  # def admin_edit_params
  #   params.require(:server).permit(:name, :username, :password, :password_confirmation)
  # end
end
