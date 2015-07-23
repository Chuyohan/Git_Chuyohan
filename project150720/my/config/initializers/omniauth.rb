OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '675766552567596', '561ecad720e3ea9f43d518b9677bb7c6', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end