require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
    @movie_1 = @studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
    @actor_1 = Actor.create!(name: 'Johnny Depp', age: 43)
    @actor_2 = Actor.create!(name: 'Penelope Cruz', age: 41)
    @actor_3 = Actor.create!(name: 'Cop dude', age: 42)
    @movie_1.films.create!(actor: @actor_1)
    @movie_1.films.create!(actor: @actor_2)
    @movie_1.films.create!(actor: @actor_3)

    visit "/movies/#{@movie_1.id}"
  end

  it 'displays each movies title, creation year, and genre' do
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  it 'lists all of the movies actors from youngest to oldest' do

    expect(@actor_2.name).to appear_before(@actor_3.name)
    expect(@actor_3.name).to appear_before(@actor_1.name)
  end

  it 'displays the average age of all of the movies actors' do
    expect(page).to have_content("Average actor age: 42")
  end
end
