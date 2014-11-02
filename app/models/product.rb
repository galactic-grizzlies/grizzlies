class Product < ActiveRecord::Base
  has_attached_file :image, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>"
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def recomendation type
    recomendation_by_recommender Recommenders::Product.get_by_type(type)
  end

  def add_recomendation type, user_id
    add_recomendation_by_recommender Recommenders::Product.get_by_type(type), user_id
  end

  private

  def recomendation_by_recommender recommender
    recommender.process_items!(self.id)
    Product.find(recommender.similarities_for(self.id).sample(4))
  end

  def add_recomendation_by_recommender recommender, user_id
    recommender.add_to_matrix(:items, user_id, self.id)
  end
end
