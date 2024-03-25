class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_subscriptions
  has_many :groups, through: :group_subscriptions
  has_many :set_dials
  has_many :dial_guesses

  def next_dial_id_to_guess(game)
    #retrieve all set dials for the game that are not user (arrays of ids)
    all_dials = game.set_dials.where.not(user: self).pluck(:id)
    #retrieve the set dials for all the guesses already done by the user for this game (array of ids)
    guessed_dials = DialGuess.joins(:set_dial).where(user: self, set_dials:{game_id: game.id}).pluck(:set_dial_id)
    #will return nil if all dials have been guessed
    (all_dials - guessed_dials).first
  end

  def game_points(game)
    my_game_guesses = game.dial_guesses.where(user: self)
    my_game_points = my_game_guesses.map do |game_guess|
    game_guess.points.abs
    end
    my_game_points.sum
  end
end
