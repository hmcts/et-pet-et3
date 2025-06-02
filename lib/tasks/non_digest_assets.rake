# Source:
# https://github.com/rails/sprockets-rails/issues/49#issuecomment-20535134

task non_digest_assets: :environment do
  assets = Rails.root.glob("public/assets/**/*")
  regex = /(-{1}[a-z0-9]{32}*\.{1}){1}/
  assets.each do |file|
    next if File.directory?(file.to_s) || file.to_s !~ regex

    source = file.split('/')
    source.push(source.pop.gsub(regex, '.'))

    non_digested = File.join(source)
    FileUtils.cp(file, non_digested)
  end
end
