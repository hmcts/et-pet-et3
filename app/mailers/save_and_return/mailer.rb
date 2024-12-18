module SaveAndReturn
  class Mailer < ::Devise::Mailer

    def access_details_email
      @current_user = params[:current_user]
      @current_store = params[:current_store]

      mail(to: @current_user.email, subject: t('save_and_return.mailer.access_details_email.subject'))
    end

  end
end
