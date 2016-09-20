ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => false,
    :address        => 'mail.nature-way.info',
    :port           => 250,
    :domain         => 'nature-way.info',
    :authentication => :plain,
    :user_name      => 'webmaster@nature-way.info',
    :password       => 'R1dd1ckone'
}

# ActionMailer::Base.default_url_options[:host] = Settings.abs_url_host
ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.default :from => "webmaster@nature-way.info<webmaster@nature-way.info>"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
