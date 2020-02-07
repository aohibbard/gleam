class User < ApplicationRecord
    has_secure_password
    has_many :products
    has_many :reviews
    has_many :manufacaturers, through: :products 
    # validations

    # scope method -- show favorite product
    # user.where(proudct, best review)
end
