class ClaimantsDetailsController < ApplicationController
  def edit
    @claimants_detail = ClaimantsDetail.new
  end

  def update
    @claimants_detail = ClaimantsDetail.new(claimants_detail_params)
    if @claimants_detail.valid?
      current_store.hash_store[:claimants_detail_answers] = @claimants_detail.to_h
      redirect_to edit_earnings_and_benefits_path
    end
  end

  private

  def claimants_detail_params
    params.require(:claimants_detail).permit(:claimants_name, :early_conciliation_details, :employment_dates,
      :continued_employment, :claimants_description_of_job_or_title)
  end
end
