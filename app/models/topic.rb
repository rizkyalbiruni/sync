class Topic < ApplicationRecord
  attribute :topic, :string
  has_many :dials
end
