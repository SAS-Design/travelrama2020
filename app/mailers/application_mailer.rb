# frozen_string_literal: true

# Top level Mailer
class ApplicationMailer < ActionMailer::Base
  default from: '"' + Rails.application.config.app_email[:display_name] + '" <' + Rails.application.config.app_email[:address] + '>'
  layout 'mailer'
end
