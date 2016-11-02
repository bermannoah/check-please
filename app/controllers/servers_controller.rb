class ServersController < ApplicationController
  def index

  end

  def new
    @server = Server.new
  end

  def create
    byebug
    @server = Server.new(server_params)
    if @server.save
      flash[:success] = "Successfully created a new account!"
      redirect_to dashboard_path(@server)
    else
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
    @server = Server.find(params[:id])
  end
  
  private
  
  def server_params
    params.require(:server).permit(:name, :username, :password, :password_confirmation)
  end
end
