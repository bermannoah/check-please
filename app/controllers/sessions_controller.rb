class SessionsController < ApplicationController

  def new
  end

  def create
    @server = Server.find_by(username: params[:username])
    if @server
      if @server.authenticate(params[:password])
        flash[:success] = "Successfully logged in!"
        session[:server_id] = @server.id
        redirect_to dashboard_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    session.delete(:server_id)
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end

end
