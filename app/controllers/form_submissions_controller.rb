class FormSubmissionsController < ApplicationController

  def index
    @reference_number = current_store.api_response["data"]["reference"]
    @submission_date = Time.zone.parse(current_store.api_response["data"]["submitted_at"]).strftime('%d/%m/%Y %H:%M')
  end

end
