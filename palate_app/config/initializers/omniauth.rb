OmniAuth.config.logger = Rails.logger

PalateApp::Application.config.FACEBOOK_APP_ID = '803171146360512'
PalateApp::Application.config.FACEBOOK_SECRET = '9632d6dd5232037da1f3b774743f0451'

PalateApp::Application.config.TWITTER_APP_ID = '3wt2czbiu2Ip45iz3o9qTWv3q'
PalateApp::Application.config.TWITTER_SECRET = 'Y0vllOomjXIrJNZIF21tWoFBcneu1ViGZXFDTsJfStLXARn8Xh'

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, Rails.configuration.FACEBOOK_APP_ID, Rails.configuration.FACEBOOK_SECRET
	provider :twitter, Rails.configuration.TWITTER_APP_ID, Rails.configuration.TWITTER_SECRET
end