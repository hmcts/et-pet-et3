class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :set_start_session_timer
  skip_after_action :save_current_store

  def not_found
    respond_to do |format|
      format.json { render json: { status: 404, error: 'Not Found' }, status: :not_found }
      format.xml { render xml: { status: 404, error: 'Not Found' }.to_xml(root: 'error'), status: :not_found }
      format.any { render file: Rails.public_path.join('404.html'), layout: false, status: :not_found }
    end
  end
end
