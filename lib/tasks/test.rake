task test: :environment do
  unless system("rspec -t ~smoke --format RspecJunitFormatter --out tmp/test/rspec.xml")
    raise "Rspec testing failed #{$?}"
  end
end

namespace :test do
  task smoke: :environment do
    puts "No smoke tests yet"
  #   ADD SMOKE TESTS
  end

  task functional: :environment do
    puts "No functional tests yet"
  end
end
