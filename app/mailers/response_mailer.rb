class ResponseMailer < ApplicationMailer
  # default from: 'notifications@meetsy.com'

  def manage
    @response = params[:response]
    @event = params[:event]
    mail(to: @response.contact.email, subject: "Manage your Meetsy RSVP for #{@event.name}")
  end
end
