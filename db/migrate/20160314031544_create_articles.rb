class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string     :nickname
      t.text       :content
      t.text       :image_url
      t.timestamps
    end
  end
end
