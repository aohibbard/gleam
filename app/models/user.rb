class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :products
    has_many :reviews
    has_many :manufacturers, through: :products 

    has_many :follows
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower_relationships
    
    has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following
    # validations

    # scope method -- show favorite product
    # user.where(proudct, best review)
end
