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

  def edit
    @response = Response.find(params[:id])
    @event = Event.find(params[:event_id])

    render 'events/show'
  end

  def update
    @response = Response.find(params[:id])
    @response = Response.update(response_params)
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end

  private

  def response_params
    params.require(:response).permit(:name, :email, :attendance, :message)
  end
end
