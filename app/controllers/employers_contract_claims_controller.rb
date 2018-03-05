class EmployersContractClaimsController < ApplicationController
  def edit
    @employers_contract_claim = EmployersContractClaim.new
  end
end
