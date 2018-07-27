class StaticPagesController < ApplicationController
  skip_before_action :check_session_expiry

  def index; end

  def expired; end
end
