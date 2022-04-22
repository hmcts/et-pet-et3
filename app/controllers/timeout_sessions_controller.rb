class TimeoutSessionsController < ApplicationController
  skip_before_action :set_start_session_timer

  def touch
    head :ok
  end

  def expired
    reset_session
  end
end
