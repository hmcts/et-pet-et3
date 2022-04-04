class ConfirmationOfSuppliedDetailsController < ApplicationController
  layout 'old_application'
  def edit
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new
    @hash_store = current_store.hash_store
  end

  def update # rubocop:disable Metrics/AbcSize
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new(confirmation_of_supplied_details_params)
    if @confirmation_of_supplied_details.valid?
      current_store.hash_store[:confirmation_of_supplied_details_answers] = @confirmation_of_supplied_details.to_h
      current_store.api_response = EtApiHandler.submit(current_store.hash_store)
      redirect_to form_submission_path
    else
      @hash_store = current_store.hash_store
      render :edit
    end
  end

  def destroy_rtf
    current_store.hash_store[:additional_information_answers].delete(:upload_additional_information)
    current_store.hash_store[:additional_information_answers].delete(:upload_file_name)
    redirect_to edit_confirmation_of_supplied_details_path
  end

  private

  def allow_update_last_path?
    true
  end

  def confirmation_of_supplied_details_params
    params.require(:confirmation_of_supplied_details).permit(:email_receipt)
  end
end
