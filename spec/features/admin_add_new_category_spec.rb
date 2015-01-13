require 'rails_helper'

feature 'admin add new category' do
  scenario do
    admin_session_sign_in

    click_on 'New category'
    fill_in 'category_name', with: Faker::Name.name
    click_on 'Create Category'

    expect(page).to have_content('Category was successfully created.')
  end
end