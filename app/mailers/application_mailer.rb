class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@example.com'
  helper ApplicationHelper
  layout 'mailer'
end
