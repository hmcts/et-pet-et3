class CaseHeardByController < ApplicationController
  def edit
    @case_heard_by ||= CaseHeardBy.new(current_store.hash_store.fetch(:case_heard_by_answers, {}))
  end

  def update
    @case_heard_by = CaseHeardBy.new(case_heard_by_params)
    if @case_heard_by.valid?
      current_store.hash_store[:case_heard_by_answers] = @case_heard_by.to_h
      redirect_to edit_claimants_details_path
    else
      render :edit
    end
  end

  private

  def allow_update_last_path?
    true
  end

  def case_heard_by_params
    params.require(:case_heard_by).permit(:case_heard_by_preference, :case_heard_by_preference_reason)
  end
end
