class UpdatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])
    @update = Update.new(update_params)
    @response = Response.new

    @update.event = @event
    @update.contact = @contact

    if @update.save
      redirect_to event_path(@update.event)
    else
      render 'events/show'
    end
  end

  def destroy
    @update = Update.find(params[:id])
    @response.destroy
    redirect_to event_path(@event)
  end

  private

  def update_params
    params.require(:update).permit(:text)
  end
end
