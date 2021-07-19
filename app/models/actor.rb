class Actor < ApplicationRecord
  has_many :films
  has_many :movies, -> { distinct }, through: :films

  def actors_worked_with
    all_actors = []
    movies.each do |movie|
      all_actors << movie.actors
    end
  end
end
