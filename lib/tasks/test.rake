task test: :environment do
  unless system("rspec -t ~smoke --format RspecJunitFormatter --out tmp/test/rspec.xml")
    raise "Rspec testing failed #{$?}"
  end
end

namespace :test do
  task smoke: :environment do
    puts "Running RSpec smoke tests..."
    unless system("rspec -t smoke --format RspecJunitFormatter --out tmp/test/smoke_rspec.xml")
      raise "Rspec smoke testing failed #{$?}"
    end
    puts "RSpec smoke tests finished."
  end

  task functional: :environment do
    puts "No functional tests yet"
  end
end
