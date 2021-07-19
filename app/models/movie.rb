class Movie < ApplicationRecord
  has_many :films
  belongs_to :studio
  has_many :actors, through: :films

  def actors_sorted_by_age
    actors.order(:age)
  end
end
