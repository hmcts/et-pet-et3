class YourRepresentativesDetailsController < ApplicationController
  def edit
    @your_representatives_details ||= YourRepresentativesDetails.new(current_store.hash_store.fetch(:your_representatives_details_answers, {}))
  end

  def update
    @your_representatives_details = YourRepresentativesDetails.new(your_representatives_details_params)
    if @your_representatives_details.valid?
      current_store.hash_store[:your_representatives_details_answers] = @your_representatives_details.to_h
      redirect_to edit_disability_path
    else
      render :edit
    end
  end

  private

  def your_representatives_details_params
    params.require(:your_representatives_details).permit(:have_representative, :type_of_representative,
      :representative_org_name, :representative_name, :representative_building, :representative_street,
      :representative_town, :representative_county, :representative_postcode, :representative_phone,
      :representative_mobile, :representative_dx_number, :representative_reference, :representative_contact_preference,
      :representative_email, :representative_fax)
  end
end
