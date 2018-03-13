class RespondentsDetailsController < ApplicationController
  def edit
    @respondents_detail = RespondentsDetail.new
  end

  def update
    @respondents_detail = RespondentsDetail.new(respondents_detail_params)
    if @respondents_detail.valid?
      current_store.hash_store[:respondents_detail_answers] = @respondents_detail.to_h
      redirect_to edit_claimants_details_path
    end
  end

  private

  def respondents_detail_params
    params.require(:respondents_detail).permit(:case_number, :name, :contact, :building_name, :street_name, :town,
      :county, :postcode, :dx_number, :contact_number, :mobile_number, :contact_preference, :email_address,
      :fax_number, :organisation_employ_gb, :employment_at_site_number)
  end
end
