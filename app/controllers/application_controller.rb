class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    browser_locales = request.env['HTTP_ACCEPT_LANGUAGE'].to_s.split(",").filter_map do |lang| 
      l = lang.split(";q=")[0]
      l if locale_available?(l)
    end

    return parsed_locale if locale_available?(parsed_locale)

    !browser_locales.empty? ? browser_locales.first : nil
  end

  def locale_available?(locale)
    I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
  end
end
