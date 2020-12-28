class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :first_category
      t.string :second_category
      t.text :group_description
      t.integer :default_img_ptn
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
