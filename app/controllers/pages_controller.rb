class PagesController < ApplicationController
  def howitworks
    @event = Event.new
  end
end
