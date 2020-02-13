class ChangeFollowingIdName < ActiveRecord::Migration[6.0]
  def change
    rename_column :follows, :following_id, :followed_user_id
  end
end
