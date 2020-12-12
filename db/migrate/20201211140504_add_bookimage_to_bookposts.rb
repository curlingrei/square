class AddBookimageToBookposts < ActiveRecord::Migration[6.0]
  def change
    add_column :bookposts, :bookimage, :string
  end
end
