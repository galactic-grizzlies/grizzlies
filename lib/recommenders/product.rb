require "recommenders/product/add"
require "recommenders/product/order"
require "recommenders/product/view"

module Recommenders
  module Product
    def self.get_by_type type
      self.const_get(type.to_s.capitalize).get
    end
  end
end
