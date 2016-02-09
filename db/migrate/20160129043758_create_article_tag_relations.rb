class CreateArticleTagRelations < ActiveRecord::Migration
  def change
    create_table :article_tag_relations do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
