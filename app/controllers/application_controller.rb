require 'securerandom'

class ApplicationController < ActionController::Base
  helper_method :start_session_timer?
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_authenticity_token
  before_action :show_maintenance_page
  before_action :set_sentry_context
  before_action :authenticate_user!
  before_action :set_cache_headers
  before_action :set_locale
  before_action :set_start_session_timer
  after_action :save_current_store

  # @return [Store] The store instance
  def current_store
    return Store.new if current_user.nil?

    current_user.store || current_user.build_store
  end

  def default_url_options(*)
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def clear_session_data
    current_store.hash_store = {}
  end

  def start_session_timer?
    @start_session_timer == true
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def set_start_session_timer
    @start_session_timer = true
  end

  def allow_update_last_path?
    false
  end

  def save_current_store
    if allow_update_last_path?
      current_store.last_path = URI.parse(request.url).tap do |r|
        r.host = nil
        r.scheme = nil
        r.port = nil
      end.to_s
    end
    # Check if current store needs saving
    return unless current_store.changed?

    # if it does save it and store the uuid in session[:store_uuid]
    current_store.save
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def show_maintenance_page(config = Rails.application.config)
    return if !config.maintenance_enabled || config.maintenance_allowed_ips.include?(request.remote_ip)

    render 'static_pages/maintenance', layout: false, status: :service_unavailable
  end

  def handle_invalid_authenticity_token
    reset_session
    set_cache_headers
    head :unprocessable_entity
  end

  def set_sentry_context
    return if current_store&.id.blank?

    Sentry.set_user(id: current_user&.id)
    set_sentry_extras
  end

  def set_sentry_extras
    Sentry.set_extras(
      {
        release: Rails.application.config.app_version,
        userId: current_user&.id,
        storeId: current_store&.id,
        caseNumber: current_store&.hash_store&.dig(:respondents_detail_answers, :case_number)
      }.compact
    )
  end
end
