class ResponsesController < ApplicationController
  before_action :set_event, only: [:create, :edit, :update, :destroy]
  before_action :set_response, only: [:edit, :update, :destroy]


  def create
    @response = Response.new(response_params)
    @response.event = @event

    if @response.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def edit
    render 'events/show'
  end

  def update
    if @response.update(response_params)
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def destroy
    @response.destroy
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:name, :email, :attendance, :message)
  end
end
