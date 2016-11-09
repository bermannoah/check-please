class ChargesController < ApplicationController

  def new
    @order = Order.find_by(id: params[:id])
  end

  def create
    # Amount in cents
    @order = Order.find_by(id: params[:id])
    @amount = @order.total_in_cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
