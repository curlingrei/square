class RemoveSecondCategoryFromGroups < ActiveRecord::Migration[6.0]
  def up
    remove_column :groups, :second_category, :string
  end

  def down
    add_column :groups, :second_category, :string
  end
end
