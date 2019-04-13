def admin_session_sign_in(user = nil)
  user ||= FactoryBot.create(:admin)

  visit '/users/sign_in'

  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password

  click_button 'Log in'
end
