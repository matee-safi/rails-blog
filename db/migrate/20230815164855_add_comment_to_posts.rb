class AddCommentToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comment, :string
    add_index :posts, :comment
  end
end
