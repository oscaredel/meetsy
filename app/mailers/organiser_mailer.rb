class OrganiserMailer < ApplicationMailer
  # default from: 'notifications@meetsy.com'

  def manage
    @event = params[:event]
    mail(to: @event.organiser.email, subject: 'Manage your Meetsy event')
  end
end
