class FormSubmissionsController < ApplicationController

  def index
    @reference_number = current_store.api_response["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.parse(current_store.api_response["meta"]["BuildResponse"]["submitted_at"]).strftime('%d/%m/%Y %H:%M')
    @pdf_url = current_store.api_response["meta"]["BuildResponse"]["pdf_url"]
    @office_address = current_store.api_response["meta"]["BuildResponse"]["office_address"]
    @office_phone_number = current_store.api_response["meta"]["BuildResponse"]["office_phone_number"]
    current_store.hash_store = {} if current_store.api_response[:status] == 201
  end

end
