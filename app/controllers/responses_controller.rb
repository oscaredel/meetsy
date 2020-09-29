class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @event = Event.find(params[:event_id])
    @response.event = @event

    if @response.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  private

  def response_params
    params.require(:response).permit(:name, :email, :attendence, :message)
  end
end
