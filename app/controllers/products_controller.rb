require "recommenders/product"

class ProductsController < ApplicationController
  def index
    @products = Product.all.order({
      order_count: :desc,
      view_count: :desc,
      add_count: :desc
    })
  end

  def show
    @product = Product.find(params[:id])

    @product.increment!(:view_count)
    @product.add_recomendation :view, session[:session_id]

    @view_recomendation = @product.recomendation :view
    @add_recomendation = @product.recomendation :add
    @order_recomendation = @product.recomendation :order
  end
end
