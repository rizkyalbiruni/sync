class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :group_subscriptions, dependent: :destroy
  validates :code, presence: true, format: { with: /\A[A-Z]{4}\z/, message: "must be 4 capital letters" }
  validates :code, uniqueness: true
  has_many :users, through: :group_subscriptions
  #has_many :games
  has_one :game
  has_many :messages, dependent: :destroy
  belongs_to :user, optional: true
end
