class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def manage
    # set session uuid of response for edit/delete button for this specific response.
    @organiser = Contact.find(params[:id])
    session[:uuid] = @organiser.id
    @event = Event.find_by(contact_id: @organiser.id)

    redirect_to event_path(@event)
  end

  def show
    @response = Response.new
    @contact = Contact.new
    @update = Update.new
    @comment = Comment.new
    @photo = Photo.new
    @photos = @event.photos.reverse.take(5)
  end

  def new
    @organiser = Contact.new
    @event = Event.new
    @event.organiser = @organiser

    if session[:uuid]
      if Response.find_by(contact_id: session[:uuid])
        @existing_event = Response.find_by(contact_id: session[:uuid]).event
      elsif Event.find_by(organiser: session[:uuid])
        @existing_event = Event.find_by(organiser: session[:uuid])
      end
    end

  end

  def create
    @organiser = Contact.new(contact_params)
    @event = Event.new(event_params)
    @event.organiser = @organiser

    # if new event date is before yesterday, set it in the future
    @event.starts_at = @event.starts_at < Time.now.prev_day(1) ? @event.starts_at.next_year : @event.starts_at

    if @organiser.save && @event.save
      session[:uuid] = @organiser.id
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
    ## TODO: limit event to future 12 months, or better, do it in a date-picker.
    @organiser = @event.organiser
    if @organiser.update(contact_params) && @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def destroy
    @event.destroy
    session.delete(:uuid)
    redirect_to :root
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def contact_params
    params.require(:event).require(:contact).permit(:name, :email, :image)
  end

  def event_params
    params.require(:event).permit(:name,
                                  :starts_at,
                                  :location,
                                  :description,
                                  :image)
  end
end
