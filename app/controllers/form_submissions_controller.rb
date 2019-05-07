class FormSubmissionsController < ApplicationController
  skip_before_action :check_session_expiry

  def index
    @reference_number = current_store.api_response[:data]["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.
        parse(current_store.api_response[:data]["meta"]["BuildResponse"]["submitted_at"]).strftime('%d/%m/%Y')
    @pdf_url = current_store.api_response[:data]["meta"]["BuildResponse"]["pdf_url"]
    @office_address = current_store.api_response[:data]["meta"]["BuildResponse"]["office_address"]
    @office_phone_number = current_store.api_response[:data]["meta"]["BuildResponse"]["office_phone_number"]
    clear_session_data if current_store.api_response[:status] == 202
  end

end
