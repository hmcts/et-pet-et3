class RespondentsDetailsController < ApplicationController
  def edit
    @respondents_detail ||= RespondentsDetail.new(current_store.hash_store.fetch(:respondents_detail_answers, {}))
  end

  def update
    @respondents_detail = RespondentsDetail.new(respondents_detail_params)
    if @respondents_detail.valid?
      current_store.hash_store[:respondents_detail_answers] = @respondents_detail.to_h
      redirect_to edit_claimants_details_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def respondents_detail_params
    params.require(:respondents_detail).permit(:case_number, :name, :contact, :company_number, :type_of_employer,
                                               :title, :other_title, :building_name, :street_name, :town, :county,
                                               :postcode, :dx_number, :contact_number, :mobile_number,
                                               :contact_preference, :email_address, :organisation_employ_gb,
                                               :organisation_more_than_one_site, :employment_at_site_number,
                                               allow_phone_or_video_attendance: [])
  end
end
