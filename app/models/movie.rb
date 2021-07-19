class Movie < ApplicationRecord
  has_many :films
  belongs_to :studio
  has_many :actors, through: :films
end
