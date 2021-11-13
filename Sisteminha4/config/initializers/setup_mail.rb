ActionMailer::Base.smtp_settings = {
  :address              => "10.30.186.170",
  :port                 => 25,
  :domain               => "petrobras.biz",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
