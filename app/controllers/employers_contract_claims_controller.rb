class EmployersContractClaimsController < ApplicationController
  def edit
    @employers_contract_claim ||= EmployersContractClaim.new(current_store.hash_store.fetch(:employer_contract_claim_answers, {}))
  end

  def update
    @employers_contract_claim = EmployersContractClaim.new(employers_contract_claim_params)
    if @employers_contract_claim.valid?
      current_store.hash_store[:employer_contract_claim_answers] = @employers_contract_claim.to_h
      redirect_to edit_confirmation_of_supplied_details_path
    else
      render :edit
    end
  end

  private

  def employers_contract_claim_params
    params.require(:employers_contract_claim).permit(:make_employer_contract_claim, :claim_information)
  end
end
