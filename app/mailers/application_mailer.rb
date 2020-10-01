class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@meetsy.com'
  layout 'mailer'
end
