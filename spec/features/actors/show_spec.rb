require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
    @movie_1 = @studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
    @movie_2 = @studio_1.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    @actor_1 = Actor.create!(name: 'Johnny Depp', age: 43)
    @actor_2 = Actor.create!(name: 'Penelope Cruz', age: 41)
    @actor_3 = Actor.create!(name: 'Cop dude', age: 42)
    @actor_4 = Actor.create!(name: 'Mike Myers', age: 54)
    @actor_5 = Actor.create!(name: 'Eddie Murphy', age: 53)
    @movie_1.films.create!(actor: @actor_1)
    @movie_1.films.create!(actor: @actor_2)
    @movie_1.films.create!(actor: @actor_3)
    @movie_2.films.create!(actor: @actor_4)
    @movie_2.films.create!(actor: @actor_5)

    visit "/actors/#{@actor_1.id}"
  end

  it 'displays the actors name and age' do
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_1.age)
  end

  it 'shows a unique list of all the actors this actor has worked with' do
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to_not have_content(@actor_4.name)
    expect(page).to_not have_content(@actor_5.name)
  end
end
