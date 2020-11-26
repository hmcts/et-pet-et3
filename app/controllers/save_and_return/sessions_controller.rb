module SaveAndReturn
  class SessionsController < ::Devise::SessionsController
    skip_before_action :authenticate_user!

    protected

    def translation_scope
      "save_and_return.#{controller_name}"
    end

    def after_sign_in_path_for(resource)
      resource.store.last_path
    end
  end
end