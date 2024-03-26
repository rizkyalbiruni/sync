class Game < ApplicationRecord
  belongs_to :group
  belongs_to :topic
  has_many :set_dials, dependent: :destroy
  has_many :group_subscriptions, through: :group
  has_many :users, through: :group_subscriptions
  has_many :messages, through: :group
  has_many :dial_guesses, through: :set_dials


  def game_finished?
  total_guesses = dial_guesses.size
  guessing_users = users.size - 1
  total_dials = self.set_dials.size
  total_guesses == guessing_users * total_dials && total_guesses != 0
  end

end
