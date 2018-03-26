def security_warnings
  p events
  # Check high alert count and print them
  print_high_alerts(high_risks) if high_count.positive?

  # Expect high alert count equal to 0
  check_high_count

  # Print alerts with risk levels
  rest_response = RestClient.get(rest_client_url, params: { zapapiformat: 'JSON', baseurl: site })
  print_alerts(JSON.parse(rest_response))
end

# Launch Owasp ZAP
def launch_owasp_zap
  # Set ZAP Path
  zap_path = determine_os == 'windows' ? 'C:\ZAP\ZAP_2.4.3' : '/Applications/ZAP 2.6.0.app/Contents/Java'
  # Go to ZAP Path
  Dir.chdir(zap_path) do
    # Determine Operating System, kill JAVA instances and Start ZAP in deamon mode.
    IO.popen("./zap.sh -daemon -config view.mode=attack -config api.disablekey=true -addoninstall pscanrulesBeta -addoninstall ascanrulesAlpha")
    sleep 5
  end
  p "Owasp Zap launch completed"
  sleep 20
end

# Operating System Determination Method
def determine_os
  if !(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
    'windows'
  elsif !(/darwin/ =~ RUBY_PLATFORM).nil?
    'mac'
  else
    'linux'
  end
end

def rest_client_url
  "http://#{ENV['zap_proxy']}:#{ENV['zap_proxy_port']}/json/core/view/alerts"
end

def events
  @events ||= JSON.parse RestClient.get(rest_client_url)
end

def site
  Capybara.app_host
end

def print_alerts(response)
  response['alerts'].each { |x| p "# {x['alert']} risk level: #{x['risk']}" }
end

def print_high_alerts(high_risks)
  high_risks.each { |x| p x['alert'] }
end

def high_risks
  @high_risks ||= events.select { |x| x['risk'] == 'High' }
end

def high_count
  high_risks.size
end

def check_high_count
  expect(high_count).to eq 0
end
