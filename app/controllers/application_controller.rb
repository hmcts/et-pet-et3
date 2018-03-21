require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  private

  def save_current_store
    # Check if current store needs saving
    return unless current_store.changed?
    # if it does save it and store the uuid in session[:store_uuid]
    current_store.save
    session[:store_uuid] = current_store.uuid
  end
end
