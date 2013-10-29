QB_CREDS = YAML.load(File.read(File.expand_path('./config/quickbooks.yml', Rails.root)))

$qb_oauth_consumer = OAuth::Consumer.new(QB_CREDS['key'], QB_CREDS['secret'], {
  site:                "https://oauth.intuit.com",
  request_token_path:  "/oauth/v1/get_request_token",
  authorize_url:       "https://appcenter.intuit.com/Connect/Begin",
  access_token_path:   "/oauth/v1/get_access_token"
})
