class PagesController < ApplicationController
  def howitworks
    @event = Event.new

    if session[:uuid]
      if Response.find_by(contact_id: session[:uuid])
        @existing_event = Response.find_by(contact_id: session[:uuid]).event
      elsif Event.find_by(organiser: session[:uuid])
        @existing_event = Event.find_by(organiser: session[:uuid])
      end
    end

  end
end
