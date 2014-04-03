if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      "app23674143@heroku.com",
    password:       "tw4u0upy",
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end