class ApplicationMailer < ActionMailer::Base
  default from: 'Meetsy <notifications@meetsy.me>'
  layout 'mailer'
end
