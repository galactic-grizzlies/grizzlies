class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :shopping_cart_count

  before_filter { session[:shopping_cart] ||= [] }

  private

  def shopping_cart_count
    session[:shopping_cart].size
  end
end
