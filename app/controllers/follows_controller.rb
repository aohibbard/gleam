class FollowsController < ApplicationController
    before_action :require_log_in

    def index
        @user = current_user.id 
    #    Following
        #followers
    end
    
    def create
        @user = User.find_by(id: params[:user_id])
        if current_user.followings << @user
            redirect_to user_path(@user)
        else 
            # flash
            redirect_to user_path(@user)
        end 
    end 

#     2.6.1 :001 > User.first.followings
#   User Load (1.0ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
#   User Load (1.4ms)  SELECT "users".* FROM "users" INNER JOIN "follows" ON "users"."id" = "follows"."followed_user_id" WHERE "follows"."follower_id" = $1 LIMIT $2  [["follower_id", 1], ["LIMIT", 11]]

    def unfollow
        @user = User.find_by(id: params[:user_id])
        relationship = current_user.given_follows.find_by(followed_user_id: @user)
        # binding.pry
        if relationship.destroy
            redirect_to user_path(@user)
        else 
            # 
            redirect_to user_path(@user)
        end 
    end 

    def followers 
        params[:user_id] && @user = User.find_by_id(params[:user_id])
        @follows = @user.followers 
    end 

    def following 
        params[:user_id] && @user = User.find_by_id(params[:user_id])
        @follows = @user.followings 
    end 


end
