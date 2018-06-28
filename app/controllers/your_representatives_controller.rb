class YourRepresentativesController < ApplicationController
  def edit
    @your_representative ||= YourRepresentative.new(current_store.hash_store.fetch(:your_representative_answers, {}))
  end

  def update
    @your_representative = YourRepresentative.new(your_representative_params)
    if @your_representative.valid?
      current_store.hash_store[:your_representative_answers] = @your_representative.to_h
      redirect_to next_page
    end
  end

  private

  def your_representative_params
    params.require(:your_representative).permit(:have_representative) if params[:your_representative]
  end

  def next_page
    if @your_representative.have_representative
      edit_your_representatives_details_path
    else
      edit_employers_contract_claim_path
    end
  end
end
