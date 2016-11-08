class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories, :set_ticket
  helper_method :current_user, :logged_in?, :current_admin?

  def set_ticket
    @ticket = Ticket.new(session[:ticket])
  end

  def current_user
    @current_user ||= Server.find(session[:server_id]) if session[:server_id]
  end

  def logged_in?
    current_user
  end

  def set_categories
    @categories = Category.all
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
