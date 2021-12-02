class TimeoutSessionsController < ApplicationController

  def destroy
    if user&.email.present?
      logout
    else
      render 'reminder'
    end
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    api_response = resource&.store&.api_response
    if api_response&.dig(:data, 'meta', 'BuildResponse', 'reference').nil?
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to new_user_session_path
    end
  end

  def touch
    head :ok
  end

  def expired
    reset_session
  end
end
