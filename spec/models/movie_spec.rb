require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many :films}
    it {should have_many(:actors).through(:films)}
  end

  describe 'instance methods' do
    describe '#actors_sorted_by_age' do
      it 'displays all the movies actors sorted by age' do
        studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
        studio_2 = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')
        movie_1 = studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
        movie_2 = studio_2.movies.create!(title: 'Harry Potter 1', creation_year: 2001, genre: 'Drama')
        actor_1 = Actor.create!(name: 'Johnny Depp', age: 43)
        actor_2 = Actor.create!(name: 'Penelope Cruz', age: 41)
        movie_1.films.create!(actor: actor_1)
        movie_1.films.create!(actor: actor_2)

        expect(movie_1.actors_sorted_by_age).to eq([actor_1, actor_2])
      end
    end
  end
end
