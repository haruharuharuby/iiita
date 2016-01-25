class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body
      t.integer :user_id, null: false
      t.integer :publication, null: false, default: false

      t.timestamps null: false
    end

    add_index :articles, :title, unique: true
  end
end
