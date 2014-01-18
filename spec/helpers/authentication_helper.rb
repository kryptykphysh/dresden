require 'spec_helper'

def request_sign_in(user)
  visit new_user_session_path
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: '!@#$%^&*()'
  click_button 'Sign in'
end

def request_sign_out
  click_link 'Sign out'
end

def request_current_user
  if request.session["warden.user.user.key"]
    User.find_by_id(request.session["warden.user.user.key"][1][0])
  else
    nil
  end
end