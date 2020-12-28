class CreateParticipates < ActiveRecord::Migration[6.0]
  def change
    create_table :participates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :group_id], unique: true
    end
  end
end
