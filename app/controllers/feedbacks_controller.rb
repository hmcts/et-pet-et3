class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!
  invisible_captcha only: [:create], honeypot: :subtitle

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      EtApiHandler.submit_feedback(@feedback)
      redirect_to feedback_path, flash: { info: t('components.feedback.create.sent') }
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:problems, :suggestions, :email_address)
  end
end