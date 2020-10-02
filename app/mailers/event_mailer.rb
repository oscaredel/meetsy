class EventMailer < ApplicationMailer
  # default from: 'notifications@meetsy.com'

  def manage
    @event = params[:event]
    @url = "http://meetsy.com/event/path/TODO" # TODO
    mail(to: @event.organiser_email, subject: 'Manage your Meetsy event')
  end
end
