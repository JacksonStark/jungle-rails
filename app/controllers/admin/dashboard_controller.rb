class Admin::DashboardController < ApplicationController
  def show
    @categories = Category.all
    @product_count = Product.count
    @category_count = Category.count
  end
end
