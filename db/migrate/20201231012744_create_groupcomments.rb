class CreateGroupcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :groupcomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
