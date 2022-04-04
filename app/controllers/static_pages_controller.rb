class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :set_start_session_timer
  before_action :sign_out_user, only: :index
  layout 'old_application', except: :index

  def index; end

  def expired; end

  def privacy; end

  def terms; end

  def start_new_session
    clear_session_data
    redirect_to edit_respondents_details_path
  end

  private

  def sign_out_user
    return if flash[:skip_sign_out]

    sign_out
  end
end
