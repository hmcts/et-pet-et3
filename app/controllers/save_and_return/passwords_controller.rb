module SaveAndReturn
  class PasswordsController < ::Devise::PasswordsController
    skip_before_action :authenticate_user!

    protected

    def translation_scope
      "save_and_return.#{controller_name}"
    end
  end
end