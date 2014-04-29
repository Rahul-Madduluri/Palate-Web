OmniAuth.config.logger = Rails.logger

PalateApp::Application.config.FACEBOOK_APP_ID = '803171146360512'
PalateApp::Application.config.FACEBOOK_SECRET = '9632d6dd5232037da1f3b774743f0451'


Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, Rails.configuration.FACEBOOK_APP_ID, Rails.configuration.FACEBOOK_SECRET
end