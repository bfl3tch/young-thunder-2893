require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many :films}
    it {should have_many(:actors).through(:films)}
  end

  describe 'instance methods' do
    describe '#actors_sorted_by_age' do
      it 'can sort all the movies actors sorted by age' do
        studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
        movie_1 = studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
        actor_1 = Actor.create!(name: 'Johnny Depp', age: 43)
        actor_2 = Actor.create!(name: 'Penelope Cruz', age: 41)
        actor_3 = Actor.create!(name: 'Cop dude', age: 42)
        movie_1.films.create!(actor: actor_1)
        movie_1.films.create!(actor: actor_2)
        movie_1.films.create!(actor: actor_3)

        expect(movie_1.actors_sorted_by_age).to eq([actor_2, actor_3, actor_1])
      end

      it 'can calculate the average age of each movies actors' do
        studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
        movie_1 = studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
        actor_1 = Actor.create!(name: 'Johnny Depp', age: 50)
        actor_2 = Actor.create!(name: 'Penelope Cruz', age: 40)
        actor_3 = Actor.create!(name: 'Cop dude', age: 30)
        movie_1.films.create!(actor: actor_1)
        movie_1.films.create!(actor: actor_2)
        movie_1.films.create!(actor: actor_3)

        expect(movie_1.average_actor_age).to eq(40)
      end
    end
  end
end
