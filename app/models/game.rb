class Game < ApplicationRecord
  belongs_to :group
  belongs_to :topic
end
