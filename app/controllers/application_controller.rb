require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale
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

  private

  def save_current_store
    current_store.last_path = URI.parse(request.url).tap { |r| r.host = nil ; r.scheme = nil ; r.port = nil }.to_s
    # Check if current store needs saving
    return unless current_store.changed?
    # if it does save it and store the uuid in session[:store_uuid]
    current_store.save
  end

  def set_locale
    session[:locale] = params[:locale] if params[:locale] && valid_locale?
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def valid_locale?
    I18n.available_locales.include?(params[:locale].to_sym)
  end
end
