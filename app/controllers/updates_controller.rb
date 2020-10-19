class UpdatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])
    @update = Update.new(update_params)

    @update.event = @event
    @update.contact = @contact

    if @update.save
      redirect_to event_path(@update.event)
    else
      # Needed to render all forms on event page
      @response = Response.new
      @photo = Photo.new
      @comment = Comment.new
      @photos = @event.photos.reverse.take(5)

      render 'events/show'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @update = Update.find(params[:id])
    @update.destroy
    redirect_to event_path(@event)
  end

  private

  def update_params
    params.require(:update).permit(:text)
  end
end
