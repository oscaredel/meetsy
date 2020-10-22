class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@meetsy.com'
  layout 'mailer'
end
