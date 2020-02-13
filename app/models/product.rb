class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :reviews

  accepts_nested_attributes_for :manufacturer, reject_if: proc {|attr| attr['name'].blank? }
  accepts_nested_attributes_for :category 

  # scope :most_recent, ->(product_id) {order("created_at desc").limit(5)}


  # def manufacturer_attributes=(attributes)
  #   if !attributes['name'].blank?
  #     self.category = Manufacturer.find_or_create_by(attributes)
  #   end 
  # end 

  def avg_rating
    if self.reviews.count < 1 
      "No reviews"
    else 
      sum = self.reviews.map {|review| review['rating']}.inject(0, :+)
      avg = sum / self.reviews.count
    end 
  end 

  # def ewg_api
  #   BASE_URI = "https://www.ewg.org/skindeep"
  # end 

end
