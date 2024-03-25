class Game < ApplicationRecord
  belongs_to :group
  belongs_to :topic
  has_many :set_dials, dependent: :destroy
  has_many :group_subscriptions, through: :group
  has_many :users, through: :group_subscriptions
  has_many :dial_guesses, through: :set_dials

end
