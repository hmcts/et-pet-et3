json.version_number ENV.fetch('APPVERSION', 'unknown')
json.build_date ENV.fetch('APP_BUILD_DATE', 'unknown')
json.commit_id ENV.fetch('APP_GIT_COMMIT', 'unknown')
json.build_tag ENV.fetch('APP_BUILD_TAG', 'unknown')
