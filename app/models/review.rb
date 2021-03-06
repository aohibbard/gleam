class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :manufacturers, through: :products
  accepts_nested_attributes_for :product, update_only: true
  validates :rating, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  validates :comment, presence: true
  # length: {in: 10..400} #, message: "Comment must be between 10 and 400 characters"

      # user.where(proudct, best review)

  scope :best, ->(product_id) {where("rating > ?", 7.5).limit(1)}
  

end
