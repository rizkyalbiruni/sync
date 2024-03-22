class SetDial < ApplicationRecord
  belongs_to :dial
  belongs_to :user
  belongs_to :game
  has_many :dial_guesses, dependent: :destroy
end
