class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    puts "HERE HERE HERE HERE HERE HERE ✅"
    puts Product.find(params[:id]).inspect
  end

end
