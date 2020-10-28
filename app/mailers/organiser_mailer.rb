class OrganiserMailer < ApplicationMailer
  # default from: 'Meetsy <notifications@meetsy.me>'

  def manage
    @event = params[:event]
    mail(to: @event.organiser.email, subject: "Manage your Meetsy space for #{@event.name}")
  end

  def new_resposne
  end

end
