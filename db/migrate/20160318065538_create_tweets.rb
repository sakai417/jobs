class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string     :title
      t.text       :content
      t.text       :image_url
      t.timestamps
    end
  end
end
