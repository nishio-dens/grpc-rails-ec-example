class ProductsController < ApplicationController
  def index
    @products = Ec::Product.all
  end

  def show
    @product = Ec::Product.find(params[:id].to_i)
  end
end
