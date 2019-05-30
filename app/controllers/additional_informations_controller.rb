class AdditionalInformationsController < ApplicationController
  def edit
    @additional_information ||= AdditionalInformation.new(current_store.hash_store.fetch(:additional_information_answers, {}))
  end

  def update
    @additional_information = AdditionalInformation.new(additional_information_params)
    if @additional_information.valid?
      current_store.hash_store[:additional_information_answers] = @additional_information.to_h
      redirect_to confirmation_of_supplied_details_path
    else
      render :edit
    end
  end

  private

  def additional_information_params
    params.require(:additional_information).permit(:upload_additional_information, :upload_file_name)
  end
end
