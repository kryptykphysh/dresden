OmniAuth.config.test_mode = true

# OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#     :provider => 'twitter',
#     :uid => '123545'
#     # etc.
#   })

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    :uid => '1235467890',
    :info => {  
                'name' => 'Test User',
                'email' => 'test_user@example.com'
              }
    # etc.
  })