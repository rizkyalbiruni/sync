class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :code, presence: true, format: { with: /\A[A-Z]{4}\z/, message: "must be 4 capital letters" }
  validates :code, uniqueness: true
  has_many :group_subscriptions
  has_many :users, through: :group_subscriptions
  has_many :games
  has_many :messages
end
