RSpec.configure do |c|
  c.before do |example|
    next if example.metadata[:smoke]

    FeatureFlag.find_or_create_by!(key: 'era_oct_26', name: 'ERA Oct 2026', default_value: true)
  end
end