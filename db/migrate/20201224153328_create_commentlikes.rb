class CreateCommentlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :commentlikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookcomment, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :bookcomment_id], unique: true
    end
  end
end
