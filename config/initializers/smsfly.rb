Smsfly.configuration do |config|
  config.login = ENV['SMS_FLY_USER']
  config.password = ENV['SMS_FLY_PASS']
end

unless Smsfly.authentication?
  raise "Smsfly: Invalid credentials"
end

