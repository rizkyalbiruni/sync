class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  def sender?(a_user)
    user.id == a_user.id
  end
end
