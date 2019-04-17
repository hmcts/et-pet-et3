class StaticPagesController < ApplicationController
  def index; end

  def expired; end

  def start_new_session
    clear_session_data
    redirect_to edit_respondents_details_path
  end
end
