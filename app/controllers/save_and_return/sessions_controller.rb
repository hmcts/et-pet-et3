module SaveAndReturn
  class SessionsController < ::Devise::SessionsController
    skip_before_action :authenticate_user!

    # POST /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      api_response = resource&.store&.api_response
      if api_response&.dig(:data, 'meta', 'BuildResponse', 'reference').nil?
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        sign_out
        set_flash_message!(:notice, :reject_submitted)
        redirect_to new_user_session_path
      end
    end

    protected

    def translation_scope
      "save_and_return.#{controller_name}"
    end

    def after_sign_in_path_for(_resource)
      respondents_details_path
    end
  end
end