class ConfirmationOfSuppliedDetailsController < ApplicationController
  def edit
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new
  end

  def update
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new(confirmation_of_supplied_details_params)
    if @confirmation_of_supplied_details.valid?
      redirect_to form_submission_path
    end
  end

  private

  def confirmation_of_supplied_details_params
    params.require(:confirmation_of_supplied_details).permit(:email_receipt, :confirm_email_receipt,
      :continued_employment, :claimants_description_of_job_or_title)
  end
end
