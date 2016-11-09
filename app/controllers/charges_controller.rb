class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    raw_total = session[:current_order_total]
    @amount = (raw_total * 100).to_i
    @total_display = raw_total

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Mobile checkout customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
