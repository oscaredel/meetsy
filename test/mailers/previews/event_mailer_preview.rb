# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  def event_created_email
    EventMailer.with(event: Event.first).event_created_email
  end
end
