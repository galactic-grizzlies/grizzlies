class Product < ActiveRecord::Base
  RECOMENDATION_NUMBER = 4

  has_attached_file :image, :styles => {
    :big => "580x524#",
    :medium => "270x270>",
    :thumb => "60x54#"
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def recomendation type
    recomendation_by_recommender Recommenders::Product.get_by_type(type), RECOMENDATION_NUMBER
  end

  def add_recomendation type, user_id
    add_recomendation_by_recommender Recommenders::Product.get_by_type(type), user_id
  end

  private

  def recomendation_by_recommender recommender, n
    recommender.process_items!(self.id)
    similar_product_ids = recommender.similarities_for(self.id).sample(n).map(&:to_i)

    if similar_product_ids.size < n
      similar_product_ids += get_n_random_except(n - similar_product_ids.size, similar_product_ids)
    end

    Product.find(similar_product_ids)
  end

  def add_recomendation_by_recommender recommender, user_id
    recommender.add_to_matrix(:items, user_id, self.id)
  end

  def get_n_random_except n, except_ids
    product_ids = Product.all.pluck(:id)
    (product_ids - except_ids).sample(n)
  end
end
