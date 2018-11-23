require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_session_expiry, :set_session_expiry, :set_locale
  after_action :save_current_store

  # @return [Store] The store instance
  def current_store
    @current_store ||= begin
      if session.key?(:store_uuid)
        # Return something that will allow saving to this row
        store = Store.where(uuid: session[:store_uuid]).first
        store ? store : Store.new
      else
        Store.new
      end
    end
  end

  def default_url_options(*)
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def save_current_store
    # Check if current store needs saving
    return unless current_store.changed?
    # if it does save it and store the uuid in session[:store_uuid]
    current_store.save
    session[:store_uuid] = current_store.uuid
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_session_expiry
    session[:expires_at] = 1.hour.from_now
  end

  def check_session_expiry
    if Time.current > session_expiration
      redirect_to session_expired_path
      reset_session
    end
  end

  def session_expiration
    session[:expires_at] ||= 1.hour.from_now
  end

end
