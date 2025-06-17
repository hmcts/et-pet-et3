class SubmitToApiJob < ApplicationJob
  queue_as :default

  retry_on EtApiHandler::SubmitError, wait: 5.minutes, attempts: 25

  def perform(current_store)
    Rails.logger.info "Submitting to API in background"
    current_store.api_response = EtApiHandler.submit(current_store.hash_store)
    current_store.save!
 end

  def after_retry_exhausted(error)
    Sentry.capture_exception(error)
    ApplicationInsights.track_exception(error)
  end
end
