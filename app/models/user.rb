class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :products
    has_many :reviews
    has_many :manufacturers, through: :products 

    has_many :follows
    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower_relationships
    # follower is the person who enacts the follow
    
    has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following
    # following means the person who is followed
    
    validates :name, presence: true
    validates :email, uniqueness: true 
    validates :username, presence: true, uniqueness: true #, length: { in: 5..15}, confirmation: true, unless: -> { password.blank? }, message: "Username must be between 5-15 charaacters"
    # validates :password, length: { minimum: 6}, message: "Password must include at least 6 charactrs"


    # scope method -- show favorite product
    # user.where(proudct, best review)

    def following?(other_user)
        following_relationships.find_by_following_id(other_user.id)
    end
    
    def follow!(other_user)
        self.follower_relationships.create(follower_id: self.id)
        self.following_relationships.create(following_id: other_user.id)
    end

    def unfollow!(other_user)
        following_relationships.find_by_following_id(other_user.id).destroy
    end

end
