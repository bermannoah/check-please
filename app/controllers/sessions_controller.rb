class SessionsController < ApplicationController

  def new
  end

  def create
    @server = Server.find_by(username: params[:username])
    if @server
      if @server.authenticate(params[:password])
        flash[:success] = "Successfully logged in!"
        session[:server_id] = @server.id

        if @server.admin?
          redirect_to admin_dashboard_path
        else
          redirect_to dashboard_path
        end
        
      else
        flash[:failure] = "Password incorrect!"
        render :new
      end
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
end
