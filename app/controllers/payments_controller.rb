class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @event = @order.event
  end
end
