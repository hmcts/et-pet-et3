Rails.application.config.to_prepare do
  ActiveRecord.yaml_column_permitted_classes = [Symbol, String, Date, DateTime, ActiveSupport::TimeWithZone, Time,
                                                ActiveSupport::HashWithIndifferentAccess]
end
