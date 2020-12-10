class CreateBookposts < ActiveRecord::Migration[6.0]
  def change
    create_table :bookposts do |t|
      t.string :title
      t.text :description
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
