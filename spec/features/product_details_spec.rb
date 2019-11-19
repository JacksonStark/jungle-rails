# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor navigates to product details home page', type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create(name: 'Apparel')

    10.times do |_n|
      @category.products.create(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They see the product details' do
    # ACTION
    visit root_path
    find_link(class: 'btn', href: '/products/2').click

    id = Product.find_by(id: 2).name

    # DEBUG / VERIFY
    expect(page).to have_css 'section.products-show'
    expect(page).to have_content id

    save_screenshot

    # puts page.html
  end
end
