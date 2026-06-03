Sentry.init do |config|
  config.dsn = ENV.fetch('RAVEN_DSN', '')
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  config.traces_sample_rate = 1.0
  ENV.fetch('APPVERSION', 'unknown').tap do |version|
    next if version == 'unknown'

    config.release = version
  end

  config.before_send = lambda do |event, _hint|
    # Add response context for ActiveJob errors
    if event.extra[:active_job] && event.extra[:arguments]&.first&.start_with?('gid://app/Store/')
      begin
        store = GlobalID::Locator.locate(event.extra[:arguments].first)
        if store
          event.user = { id: claim.user.id } if claim.user
          event.extra.merge!(
            release: Rails.application.config.app_version,
            userId: current_user&.id,
            storeId: store&.id,
            caseNumber: store&.hash_store&.dig(:respondents_detail_answers, :case_number)
          )
        end
      rescue StandardError
        # Ignore errors locating the claim
      end
    end
    event
  end
end
