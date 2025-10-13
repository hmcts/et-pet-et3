task test: :environment do
  unless system("rspec -t ~smoke --format documentation --format RspecJunitFormatter --out tmp/test/rspec.xml")
    raise "Rspec testing failed #{$?}"
  end
end

namespace :test do
  task smoke: :environment do
    unless system("rspec -t smoke --format progress --format RspecJunitFormatter --out tmp/test/rspec.xml spec/features/smoke_spec.rb")
      raise "Rspec smoke testing failed #{$CHILD_STATUS}"
    end
  end

  task functional: :environment do
    puts "No functional tests yet"
  end
end
