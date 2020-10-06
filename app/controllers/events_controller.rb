class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def manage
    # set session uuid of response for edit/delete button for this specific response.
    @organiser = Organiser.find(params[:id])
    session[:uuid] = @organiser.id
    @event = Event.find_by(organiser_id: @organiser.id)

    redirect_to event_path(@event)
  end

  def show
    @response = Response.new
  end

  def new
    @organiser = Organiser.new
    @event = Event.new
  end

  def create
    @organiser = Organiser.new(organiser_params)
    @event = Event.new(event_params)
    @event.organiser = @organiser

    if @organiser.save && @event.save
      redirect_to event_path(@event)
      OrganiserMailer.with(event: @event).manage.deliver_now
    else
      render 'new'
    end
  end

  def edit
    @organiser = @event.organiser
  end

  def update
    @organiser = @event.organiser
    if @organiser.update(organiser_params) && @event.update(event_params)
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

  def organiser_params
    params.require(:event).require(:organiser).permit(:name, :email)
  end

  def event_params
    params.require(:event).permit(:name,
                                  :starts_at,
                                  :location,
                                  :description,
                                  :image)
  end
end
