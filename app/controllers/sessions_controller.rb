class SessionsController < ApplicationController

  def create
    @server = Server.find_by(username: params[:username])

    if @server
      authenticate_server
    else
      flash[:failure] = "Username incorrect!"
      render :new
    end
  end

  def destroy
    session.delete(:server_id)
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end

  private

  def authenticate_server
    if @server.authenticate(params[:password])
      flash[:success] = "Successfully logged in!"
      session[:server_id] = @server.id
      check_admin_status
    else
      flash[:failure] = "Password incorrect!"
      render :new
    end
  end

  def check_admin_status
    if @server.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end

end
