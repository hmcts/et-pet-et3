class FormSubmissionsController < ApplicationController

  def index
    @reference_number = current_store.api_response[:data]["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.parse(current_store.api_response[:data]["meta"]["BuildResponse"]["submitted_at"]).strftime('%d/%m/%Y %H:%M')
    current_store.hash_store = {} if current_store.api_response[:status] == 201
  end

end
