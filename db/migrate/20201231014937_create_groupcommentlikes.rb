class CreateGroupcommentlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :groupcommentlikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :groupcomment, null: false, foreign_key: true
      t.index [:user_id, :groupcomment_id], unique: true
      t.timestamps
    end
  end
end
