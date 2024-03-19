class AddCodeToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :code, :string
  end
end
