# frozen_string_literal: true

require 'rails_helper'

# removed `, js:true` from end of line
RSpec.feature 'Visitor clicks add to cart button on a product', type: :feature, js: true do
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

  scenario 'They see the cart updated by one' do
    # ACTION
    visit root_path
    my_button = page.all('form .fa.fa-shopping-cart').first
    # id = Product.find_by(id: 2).name
    my_button.click

    # DEBUG / VERIFY
    # expect(page).to have_css 'section.products-show'
    expect(page).to have_content 'My Cart (1)'
    puts page.html

    save_screenshot
  end
end
