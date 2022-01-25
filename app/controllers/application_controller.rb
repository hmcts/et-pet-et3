require 'securerandom'

class ApplicationController < ActionController::Base
  helper_method :start_session_timer?
  protect_from_forgery with: :exception

  before_action :authenticate_user!
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

  def set_start_session_timer
    @start_session_timer = true
  end

  def allow_update_last_path?
    false
  end

  def save_current_store
    if allow_update_last_path?
      current_store.last_path = URI.parse(request.url).tap { |r| r.host = nil ; r.scheme = nil ; r.port = nil }.to_s
    end
    # Check if current store needs saving
    return unless current_store.changed?
    # if it does save it and store the uuid in session[:store_uuid]
    current_store.save
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
