class Movie < ApplicationRecord
  has_many :films
  belongs_to :studio
  has_many :actors, through: :films

  def actors_sorted_by_age
    actors.order(:age)
  end

  def average_actor_age
    actors.average(:age)
  end

  def movie_actors
    actors
  end
end
