require 'rails_helper'

feature 'admin add new product' do
  let!(:category) { create(:category) }

  scenario do
    admin_session_sign_in

    click_on 'New product'
    fill_in 'product_title', with: Faker::Name.name
    fill_in 'product_description', with: Faker::Lorem.sentence(3)
    select category.name, from: 'product_category_id'
    click_on 'Create Product'

    expect(page).to have_content('Product was successfully created.')
  end
end