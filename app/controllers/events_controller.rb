class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
    @response = Response.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    redirect_to :root
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name,
                                  :date_time,
                                  :location,
                                  :description,
                                  :image,
                                  :organiser_name,
                                  :organiser_email)
  end
end
