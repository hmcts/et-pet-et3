class ResponsesController < ApplicationController
  def edit
    @response ||= Response.new(current_store.hash_store.fetch(:response_answers, {}))
  end

  def update
    @response = Response.new(response_params)
    if @response.valid?
      current_store.hash_store[:response_answers] = @response.to_h
      redirect_to edit_your_representative_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def response_params
    params.require(:response).permit(:defend_claim, :defend_claim_facts)
  end
end
