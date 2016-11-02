class ServersController < ApplicationController
  def index

  end

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

  def update
  end

  def delete
  end

  def edit
  end

  def show
    @server = Server.find(session[:server_id])

  end

  private

  def server_params
    params.require(:server).permit(:name, :username, :password, :password_confirmation)
  end

  def flash_handler
    if !params[:password] && !params[:password_confirmation]
      flash[:failure] = "Please add a password!"
    elsif !params[:password_confirmation]
      flash[:failure] = "Please confirm your password!"
    elsif params[:password] != params[:password_confirmation]
      flash[:failure] = "Passwords must match!"
    elsif !params[:username]
      flash[:failure] = "Please enter a username!"
    end
  end
end
