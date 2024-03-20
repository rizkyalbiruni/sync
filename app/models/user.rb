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
end
