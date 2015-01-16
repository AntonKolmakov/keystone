require 'rails_helper'

feature 'user add review' do
  let!(:product) { create(:product) }

  scenario 'responds failure' do
    admin_session_sign_in

    click_on product.title

    fill_in 'review_msg', with: ''

    click_on 'Submit'

    expect(page).to have_content("can't be blank")
  end

  scenario 'responds successfully' do
    admin_session_sign_in

    click_on product.title

    fill_in 'review_msg', with: Faker::Lorem.sentence(3)

    click_on 'Submit'

    expect(page).to have_content(Product.last.reviews.take.msg)
  end
end