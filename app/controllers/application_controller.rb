# frozen_string_literal: true

# Top level Controller
class ApplicationController < ActionController::Base
  add_flash_types :error, :alert, :success, :notice, :primary, :secondary, :light, :dark
  before_action :set_locale

  # Support for non-English languages (requires l18n file in config/locales)
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
