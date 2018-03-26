class FormSubmissionsController < ApplicationController

  def index
    @reference_number = current_store.api_response["data"]["reference"]
    @submission_date = current_store.api_response["data"]["submitted_at"]
  end

end
