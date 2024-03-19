class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :group_subscriptions
  has_many :users, through: :group_subscriptions
  has_many :games
  has_many :messages
end
