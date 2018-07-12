class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :description
      t.string :source
      t.datetime :publishedAt
      t.string :title
      t.string :url
      t.boolean :to_read
    end
  end
end
