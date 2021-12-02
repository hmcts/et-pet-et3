class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :set_start_session_timer

  def index; end

  def expired; end

  def privacy; end

  def terms; end

  def start_new_session
    clear_session_data
    redirect_to edit_respondents_details_path
  end
end
