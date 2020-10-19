class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @event = @order.event
  end

  def create
    event = Event.find(params[:event_id])
    contact = Contact.find(params[:contact_id])
    order = Order.create!(state: 'pending', amount: 150, event: event, contact: contact)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Upgrade event: #{event.name}",
        images: [],
        amount: order.amount,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
