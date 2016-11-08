class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def show
    @dashboard = Dashboard.new
    @dashboard.set_admin(session[:server_id])
    @dashboard.set_status(params[:order][:status]) if params[:order]
  end

private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
