Smsfly.configuration do |config|
  config.login = ENV['SMS_SLY_USER']
  config.password = ENV['SMS_SLY_PASS']
end

unless Smsfly.authentication?
  raise "Smsfly: Invalid credentials"
end

