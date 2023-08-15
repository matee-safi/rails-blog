class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: :users, name: 'fk_comments_author_id' }
      t.references :post, foreign_key: { to_table: :posts, name: 'fk_comments_post_id' }
      t.text :text
      t.timestamps
    end
  end
end
