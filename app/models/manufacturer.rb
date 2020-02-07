class Manufacturer < ApplicationRecord
    has_many :products
    has_many :reviews, through: :products 
    has_many :users, through: products 

    # scope method -- show favorite product
    # user.where(proudct, best review)
end
