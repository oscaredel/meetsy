class ResponseMailer < ApplicationMailer
  # default from: 'Meetsy notification <notifications@meetsy.me>'

  def manage
    @response = params[:response]
    @event = params[:event]
    mail(to: @response.contact.email, subject: "Manage your Meetsy RSVP for #{@event.name}")
  end
end
