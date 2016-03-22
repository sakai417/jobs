class RemoveColumnFromCommetts < ActiveRecord::Migration
  def change
    remove_column :comments, :article_id, :integer
    remove_column :comments, :tweet_id, :integer
  end
end
