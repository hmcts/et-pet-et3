class FormSubmissionsController < ApplicationController

  def index
    @reference_number = current_store.api_response["meta"]["BuildResponse"]["reference"]
    @submission_date = Time.zone.parse(current_store.api_response["meta"]["BuildResponse"]["submitted_at"]).strftime('%d/%m/%Y %H:%M')
  end

end
