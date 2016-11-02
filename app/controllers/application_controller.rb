class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories, :set_ticket

  def set_ticket
    @ticket = Ticket.new(session[:ticket])
  end

  def set_categories
    @categories = Category.all
  end
end
