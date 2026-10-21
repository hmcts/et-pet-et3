class ConfirmationOfSuppliedDetailsController < ApplicationController
  rescue_from EtApiHandler::SubmitError, with: :handle_api_error
  PAGE_MAPPINGS = {
    respondents_detail_answers: :respondents_details_path,
    claimants_detail_answers: :claimants_details_path,
    employer_contract_claim_answers: :employers_contract_claim_path,
  }.with_indifferent_access.freeze

  def edit
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new
    @hash_store = current_store.hash_store
  end

  def update # rubocop:disable Metrics/AbcSize
    @confirmation_of_supplied_details = ConfirmationOfSuppliedDetails.new(confirmation_of_supplied_details_params)
    if @confirmation_of_supplied_details.valid?
      current_store.hash_store[:confirmation_of_supplied_details_answers] = @confirmation_of_supplied_details.to_h
      current_store.save
      result = EtApiHandler.submit(current_store.hash_store)
      if result.valid?
        current_store.api_response = result.response
        redirect_to form_submission_path
      else
        page = result.errors.first.attribute.to_s.split('/').first
        route = map_error_source_to_route(page)
        if respond_to?(route)
          redirect_to send(route)
        else
          redirect_to confirmation_of_supplied_details_path
        end
      end
    else
      @hash_store = current_store.hash_store
      render :edit
    end
  end

  def destroy_rtf
    current_store.hash_store[:additional_information_answers].delete(:upload_additional_information)
    redirect_to edit_confirmation_of_supplied_details_path
  end

  private

  def allow_update_last_path?
    true
  end

  def confirmation_of_supplied_details_params
    params.require(:confirmation_of_supplied_details).permit(:email_receipt)
  end

  def handle_api_error(exception)
    SubmitToApiJob.new(current_store).enqueue(wait: 30.seconds)
    redirect_to form_submission_in_progress_path
  end

  def map_error_source_to_route(source)
    if PAGE_MAPPINGS.key?(source)
      PAGE_MAPPINGS[source]
    else
      :"#{source.gsub(/_answers\z/, '')}_path"
    end
  end
end
