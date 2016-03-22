class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text          :content
      t.integer       :user_id
      t.integer       :article_id
      t.integer       :tweet_id
      t.timestamps
    end
  end
end
