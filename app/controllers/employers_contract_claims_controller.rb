class EmployersContractClaimsController < ApplicationController
  def edit
    @employers_contract_claim = EmployersContractClaim.new
  end

  def update
    @employers_contract_claim = EmployersContractClaim.new(employers_contract_claim_params)
    if @employers_contract_claim.valid?
      redirect_to edit_confirmation_of_supplied_details_path
    end
  end

  private

  def employers_contract_claim_params
    params.require(:employers_contract_claim).permit(:make_employer_contract_claim, :claim_information,
      :additional_information)
  end
end
