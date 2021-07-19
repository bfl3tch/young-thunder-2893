class Actor < ApplicationRecord
  has_many :films
  has_many :movies, through: :films
end
