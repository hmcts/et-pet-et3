module SaveAndReturn
  class RegistrationsController < ::Devise::RegistrationsController
    before_action :configure_permitted_parameters

    def create
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
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

    def build_resource(*)
      super.tap(&:assign_reference)
    end
  end
end