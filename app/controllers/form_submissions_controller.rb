class FormSubmissionsController < ApplicationController
  before_action :disable_save_and_return

  def index
    @reference_number = current_store.api_response[:data]["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.
        parse(current_store.api_response[:data]["meta"]["BuildResponse"]["submitted_at"]).to_date
    @pdf_url = current_store.api_response[:data]["meta"]["BuildResponse"]["pdf_url"]
    @office_address = current_store.api_response[:data]["meta"]["BuildResponse"]["office_address"]
    @office_email = current_store.api_response[:data]["meta"]["BuildResponse"]["office_email"]
    @office_phone_number = current_store.api_response[:data]["meta"]["BuildResponse"]["office_phone_number"]
    @respondent_email = current_store.hash_store.dig(:respondents_detail_answers, :email_address)
    clear_session_data if current_store.api_response[:status] == 202
  end

  def disable_save_and_return
    @disable_save_and_return = true
  end

end
