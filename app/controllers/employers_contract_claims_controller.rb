class EmployersContractClaimsController < ApplicationController
  def edit
    @employers_contract_claim = EmployersContractClaim.new
  end

  def update
    @employers_contract_claim = EmployersContractClaim.new(employers_contract_claim_params)
    if @employers_contract_claim.valid?
      current_store.hash_store[:employer_contract_claim_answers] = @employers_contract_claim.to_h
      redirect_to edit_confirmation_of_supplied_details_path
    end
  end

  private

  def employers_contract_claim_params
    temp = temp_change_upload_name(params.dup)
    # TODO: Revert to params once upload functionality is built
    temp.require(:employers_contract_claim).permit(:make_employer_contract_claim, :claim_information,
      :upload_additional_information)
  end

  def temp_change_upload_name(params)
    params[:employers_contract_claim][:upload_additional_information] = params[:employers_contract_claim][:upload_additional_information].original_filename
    params
  end
end
