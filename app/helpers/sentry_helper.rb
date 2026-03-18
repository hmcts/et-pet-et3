module SentryHelper
  def sentry_public_meta_tags
    return if Rails.application.config.sentry_public_dsn.blank?

    render partial: 'shared/sentry_public_tags',
           locals: {
             sentry_public_dsn: Rails.application.config.sentry_public_dsn,
             data: sentry_public_data
           }
  end

  private

  def sentry_public_data
    store = current_user&.store
    { release: Rails.application.config.app_version,
      userId: current_user&.id,
      storeId: store&.id,
      caseNumber: store&.hash_store&.dig(:respondents_detail_answers, :case_number) }
  end
end
