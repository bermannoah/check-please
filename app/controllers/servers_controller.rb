class ServersController < ApplicationController

  def new
    @server = Server.new
  end

  def create
    @server = Server.new(server_params)
    if @server.save
      session[:server_id] = @server.id
      flash[:success] = "Successfully created a new account!"
      redirect_to dashboard_path
    else
      flash_handler
      render :new
    end
  end

  def show
    @server = Server.find(session[:server_id])
  end


  private

  def server_params
    params.require(:server).permit(:name, :username, :password, :password_confirmation)
  end

  def flash_handler
    if params[:server][:password].empty? && params[:server][:password_confirmation].empty?
      flash[:failure] = "Please add a password!"
    elsif params[:server][:password_confirmation].empty?
      flash[:failure] = "Please confirm your password!"
    elsif params[:server][:username].empty?
      flash[:failure] = "Please enter a username!"
    elsif params[:server][:password] != params[:server][:password_confirmation]
      flash[:failure] = "Passwords must match!"
    end
  end
end
