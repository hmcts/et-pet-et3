module SaveAndReturn
  class RegistrationsController < ::Devise::RegistrationsController
    skip_before_action :authenticate_user!
    skip_before_action :set_start_session_timer
    before_action :configure_permitted_parameters
    layout 'old_application'

    def create
      super
      deliver_access_details
    end

    private



    def deliver_access_details
      return unless current_store && current_store&.user&.email.present?

      Mailer.with(current_user: current_user, current_store: current_store).access_details_email.deliver_now if current_store&.user&.email.present?
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :reference])
    end

    def translation_scope
      "save_and_return.#{controller_name}"
    end

    def after_sign_up_path_for(resource)
      edit_respondents_details_path
    end

    def sign_up_params
      params.require(:save_and_return).require(:user).permit(:email, :password, :reference).to_h.with_indifferent_access
    end
  end
end
