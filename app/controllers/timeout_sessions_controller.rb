class TimeoutSessionsController < ApplicationController

  def touch
    head :ok
  end

  def expired
    reset_session
  end
end
