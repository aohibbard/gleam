class Follow < ApplicationRecord
    # belongs_to :follower, foreign_key: 'user_id', class_name: 'User'
    # belongs_to :following, foreign_key: 'following_id', class_name: 'User'
    # user who follows the other user -- create instance method called follower. Find follower_id's user
    belongs_to :follower, foreign_key: :follower_id, class_name: "User"

    # user who receives the follow
    # given a follow instance, return user instance for user being followed
    belongs_to :followed_user, foreign_key: :followed_user_id, class_name: "User"

end