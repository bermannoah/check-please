class ServersController < ApplicationController
  def index

  end

  def new
    @server = Server.new
  end

  def create
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
  end
end
