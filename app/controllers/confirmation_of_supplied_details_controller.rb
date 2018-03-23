require 'httparty'

class ConfirmationOfSuppliedDetailsController < ApplicationController
  def edit
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new
    @hash_store = current_store.hash_store
  end

  def update
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new(confirmation_of_supplied_details_params)
    if @confirmation_of_supplied_details.valid?
      current_store.hash_store[:confirmation_of_supplied_details_answers] = @confirmation_of_supplied_details.to_h
      EtApiHandler.submit(current_store.hash_store)
      redirect_to form_submission_path
    end
  end

  private

  def confirmation_of_supplied_details_params
    params.require(:confirmation_of_supplied_details).permit(:email_receipt, :confirm_email_receipt,
      :continued_employment, :claimants_description_of_job_or_title)
  end
end
