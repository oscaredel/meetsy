class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @event = @order.event
  end

  def complete
    @order = Order.find(params[:id])
    @event = @order.event

    @order.state = 'completed'
    @order.save

    redirect_to order_path(@order)
  end

  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(params[:contact_id])
    if @event.order
      @order = @event.order
      @order.contact = @contact
    else
      @order = Order.create!(state: 'pending', amount: 200, event: @event, contact: @contact)
    end

    @session = Stripe::Checkout::Session.create(
      customer_email: @contact.email,
      payment_method_types: %w[ideal card],
      line_items: [{
        name: "Upgrade event: #{@event.name}",
        images: [],
        amount: @order.amount,
        currency: 'eur',
        quantity: 1
      }],
      success_url: complete_order_url(@order),
      cancel_url: new_order_payment_url(@order)
    )

    @order.update(checkout_session_id: @session.id)
    redirect_to new_order_payment_path(@order)
  end
end
