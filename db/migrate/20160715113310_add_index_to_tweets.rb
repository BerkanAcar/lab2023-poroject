class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer
    add_column :tweets, :count, :integer
  end
end
