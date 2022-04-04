class TimeoutSessionsController < ApplicationController
  layout 'old_application'

  def touch
    head :ok
  end

  def expired
    reset_session
  end
end
