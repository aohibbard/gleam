class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
  # belongs_to :bodies
  has_and_belongs_to_many :users
  has_many :reviews

  accepts_nested_attributes_for :manufacturer, reject_if: proc {|attr| attr['name'].blank? }
  # accepts_nested_attributes_for :bodies
  accepts_nested_attributes_for :category 

  # def manufacturer_attributes=(attributes)
  #   if !attributes['name'].blank?
  #     self.category = Manufacturer.find_or_create_by(attributes)
  #   end 
  # end 

  def avg_rating
    sum = self.reviews.map {|review| review['rating']}.inject(0, :+)
    avg = sum / self.reviews.count
  end 

  # def ewg_api
  #   BASE_URI = "https://www.ewg.org/skindeep"
  # end 

end
