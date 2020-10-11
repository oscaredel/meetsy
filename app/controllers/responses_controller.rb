class ResponsesController < ApplicationController
  before_action :set_event, only: [:create, :edit, :update, :destroy]
  before_action :set_response, only: [:manage, :edit, :update, :destroy]

  def manage
    # set session uuid of response for edit/delete button for this specific response.
    session[:uuid] = @response.contact.id
    @event = @response.event

    redirect_to event_path(@event)
  end

  def create
    @response = Response.new(response_params)
    @contact = Contact.new(contact_params)
    @update = Update.new

    @response.event = @event
    @response.contact = @contact

    if @contact.save && @response.save
      session[:uuid] = @response.contact.id
      redirect_to event_path(@event)
      ResponseMailer.with(response: @response, event: @event).manage.deliver_now
    else
      render 'events/show'
    end
  end

  def edit
    @contact = @response.contact
    @update = Update.new
    render 'events/show'
  end

  def update
    @contact = @response.contact
    if @contact.update(contact_params) && @response.update(response_params)
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def destroy
    @response.destroy
    session.delete(:uuid)
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end

  def contact_params
    params.require(:response).require(:contact).permit(:name, :email)
  end

  def response_params
    params.require(:response).permit(:attendance, :message)
  end
end
