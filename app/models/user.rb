class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :products
    has_many :reviews
    has_many :manufacturers, through: :products 

    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow" #return array of follows for given user
    has_many :followers, through: :received_follows, source: :follower #return an array of followers
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow" #returns who a given user follows
    has_many :followings, through: :given_follows, source: :followed_user #aliasing
    # user.followers & user.followings
    
    validates :name, presence: true
    validates :email, uniqueness: true 
    # validates :username, presence: true, uniqueness: true #, length: { in: 5..15}, confirmation: true, unless: -> { password.blank? }, message: "Username must be between 5-15 charaacters"
    # validates :password, length: { minimum: 6}, message: "Password must include at least 6 charactrs"


    # refactor from controller
    def following?(other_user)
        followings.include?(other_user)
    end
   
    def follow(other_user)
        # assign current user to other user's followings
        followings.update()
    end

    def unfollow(other_user)
        followings.find_by(followed_user_id: other_user).destroy
    end

end
