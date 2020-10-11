class UpdatesController < ApplicationController

  def create
    @update = Update.new(update_params)
    @update.event = Event.find(params[:event_id])
    @update.contact = Contact.find(session[:uuid])

    if @update.save
      redirect_to event_path(@update.event)
    else
      render 'events/show'
    end
  end

  private

  def update_params
    params.require(:update).permit(:text)
  end
end
