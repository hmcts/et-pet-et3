class ClaimantsDetailsController < ApplicationController
  def edit
    @claimants_detail ||= ClaimantsDetail.new(current_store.hash_store.fetch(:claimants_detail_answers, {}))
  end

  def update
    @claimants_detail = ClaimantsDetail.new(claimants_detail_params)
    if @claimants_detail.valid?
      current_store.hash_store[:claimants_detail_answers] = @claimants_detail.to_h
      redirect_to edit_earnings_and_benefits_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def claimants_detail_params
    params.require(:claimants_detail).permit(:claimants_name, :agree_with_early_conciliation_details,
      :disagree_conciliation_reason, :agree_with_employment_dates, :employment_start_dd, :employment_start_mm,
      :employment_start_yyyy, :employment_end_dd, :employment_end_mm, :employment_end_yyyy, :disagree_employment,
      :continued_employment, :agree_with_claimants_description_of_job_or_title, :disagree_claimants_job_or_title)
  end
end
