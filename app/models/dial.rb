class Dial < ApplicationRecord
  belongs_to :topic
  has_many :set_dials
end
