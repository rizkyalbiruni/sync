class SetDial < ApplicationRecord
  belongs_to :dial
  belongs_to :user
  belongs_to :game
  has_many :dial_guesses, dependent: :destroy

  def all_guessed?
    dial_guesses.size == game.group.users.size - 1
  end
end
