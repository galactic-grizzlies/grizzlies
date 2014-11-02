module Recommenders
  module Product
    class View
      include Predictor::Base
      limit_similarities_to 10
      input_matrix :items

      def self.get
        @instance ||= self.new
      end
    end
  end
end
