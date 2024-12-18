class FormSubmissionsController < ApplicationController
  skip_before_action :set_start_session_timer
  before_action :disable_save_and_return
  helper_method :current_store

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def index
    @reference_number = current_store.api_response[:data]["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.
                       parse(current_store.api_response[:data]["meta"]["BuildResponse"]["submitted_at"]).to_date
    @pdf_url = current_store.api_response[:data]["meta"]["BuildResponse"]["pdf_url"]
    @office_address = current_store.api_response[:data]["meta"]["BuildResponse"]["office_address"]
    @office_email = current_store.api_response[:data]["meta"]["BuildResponse"]["office_email"]
    @office_phone_number = current_store.api_response[:data]["meta"]["BuildResponse"]["office_phone_number"]
    @respondent_email = current_store.hash_store.dig(:respondents_detail_answers, :email_address)
    @additional_information_file = current_store.hash_store.dig(:additional_information_answers,
                                                                :upload_additional_information, :filename)
    clear_session_data if current_store.api_response[:status] == 202
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def disable_save_and_return
    @disable_save_and_return = true
  end
end
