class ApplicationMailer < ActionMailer::Base
  default to: "info@yak.com", from: "info@yak.com"
  layout 'mailer'
end
