class AddUserIdToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :user, foreign_key: true
  end
end