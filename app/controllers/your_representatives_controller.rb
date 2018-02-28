class YourRepresentativesController < ApplicationController
  def edit
    @your_representative = YourRepresentative.new
  end

  def update
    @your_representative = YourRepresentative.new(your_representative_params)
    if @your_representative.valid?
      if @your_representative.have_representative
        redirect_to edit_your_representatives_details_path
      else
        redirect_to edit_employers_contract_claim_path
      end
    end
  end

  private

  def your_representative_params
    params.require(:your_representative).permit(:have_representative)
  end
end
