class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: :users, name: 'fk_likes_author_id' }
      t.references :post, foreign_key: { to_table: :posts, name: 'fk_likes_post_id' }
      t.timestamps
    end
  end
end
