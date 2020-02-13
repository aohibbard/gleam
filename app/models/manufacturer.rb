class Manufacturer < ApplicationRecord
    has_many :products
    has_many :reviews, through: :products 
    has_many :categories, through: :products

    # scope :most_recent, ->(product_id){order("created_at desc").limit(5)}
f
    # scope method -- show favorite product
    # user.where(proudct, best review)
end
