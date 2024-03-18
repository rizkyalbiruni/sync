class SetDial < ApplicationRecord
  belongs_to :dial
  belongs_to :user
  belongs_to :game
end
