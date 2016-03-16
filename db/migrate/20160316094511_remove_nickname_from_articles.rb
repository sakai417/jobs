class RemoveNicknameFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :nickname, :string
  end
end
