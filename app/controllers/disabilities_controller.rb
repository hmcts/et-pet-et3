class DisabilitiesController < ApplicationController
  layout 'old_application'
  def edit
    @disability ||= Disability.new(current_store.hash_store.fetch(:disability_answers, {}))
  end

  def update
    @disability = Disability.new(disability_params)
    if @disability.valid?
      current_store.hash_store[:disability_answers] = @disability.to_h
      redirect_to edit_employers_contract_claim_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def disability_params
    params.require(:disability).permit(:disability, :disability_information)
  end
end
