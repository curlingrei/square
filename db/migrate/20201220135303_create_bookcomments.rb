class CreateBookcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :bookcomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookpost, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
