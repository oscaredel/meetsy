class EventMailer < ApplicationMailer
  # default from: 'notifications@meetsy.com'

  def event_created_email
    @event = params[:event]
    @url = "http://meetsy.com/event/path/TODO"
    mail(to: @event.organiser_email, subject: 'Manage your Meetsy event')
  end
end
