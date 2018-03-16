class ConfirmationOfSuppliedDetailsController < ApplicationController
  def edit # rubocop:disable Metrics/AbcSize
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new
    @respondents_detail_answers = current_store.hash_store[:respondents_detail_answers]
    @claimants_detail_answers = current_store.hash_store[:claimants_detail_answers]
    @earnings_and_benefits_answers = current_store.hash_store[:earnings_and_benefits_answers]
    @response_answers = current_store.hash_store[:response_answers]
    @your_representative_answers = current_store.hash_store[:your_representative_answers]
    @your_representatives_details_answers = current_store.hash_store[:your_representatives_details_answers]
    @employer_contract_claim_answers = current_store.hash_store[:employer_contract_claim_answers]
  end

  def update
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new(confirmation_of_supplied_details_params)
    if @confirmation_of_supplied_details.valid?
      current_store.hash_store[:confirmation_of_supplied_details_answers] = @confirmation_of_supplied_details.to_h
      redirect_to form_submission_path
    end
  end

  private

  def confirmation_of_supplied_details_params
    params.require(:confirmation_of_supplied_details).permit(:email_receipt, :confirm_email_receipt,
      :continued_employment, :claimants_description_of_job_or_title)
  end
end
