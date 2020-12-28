class AddDetialsToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :target_age, :string
    add_column :groups, :target_sex, :string
    add_column :groups, :hope_time, :string
    add_column :groups, :target_number, :integer
  end
end
