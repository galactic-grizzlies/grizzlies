class CheckoutController < ApplicationController
  def index
    @shopping_cart = if session[:shopping_cart].empty?
      []
    else
      Product.find(session[:shopping_cart])
    end
  end

  def add
    @product = Product.find(params[:product_id])

    unless session[:shopping_cart].include? params[:product_id]
      session[:shopping_cart] << params[:product_id]

      @product.increment!(:add_count)
      @product.add_recomendation :add, session[:session_id]
    end
  end

  def delete
    @deleted_product_id = session[:shopping_cart].delete(params[:product_id])
    redirect_to checkout_url
  end

  def order
    session[:shopping_cart].each do |product_id|
      product = Product.find(product_id)
      product.increment!(:order_count)
      product.add_recomendation :order, session[:session_id]
    end

    session[:shopping_cart] = []

    redirect_to checkout_success_url
  end

  def success
    render layout: 'layouts/base'
  end
end
