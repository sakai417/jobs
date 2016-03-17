class RemoveJobFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :job, :string
  end
end
