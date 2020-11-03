module SaveAndReturn
  class SessionsController < ::Devise::SessionsController

    protected

    def translation_scope
      "save_and_return.#{controller_name}"
    end

    def after_sign_in_path_for(resource)
      resource.store.last_path
    end
  end
end