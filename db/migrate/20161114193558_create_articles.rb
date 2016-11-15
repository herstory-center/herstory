class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :auto_url
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
