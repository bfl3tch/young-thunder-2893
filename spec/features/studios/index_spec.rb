require 'rails_helper'

RSpec.describe 'The Studio Index Page' do
  it 'displays each studios name and location' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
    studio_2 = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')
    visit '/studios'

    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(studio_2.location)
  end

  it 'displays the titles of all the studios movies' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
    studio_2 = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
    movie_2 = studio_1.movies.create!(title: 'Jurassic Park', creation_year: 1995, genre: 'Drama')
    movie_3 = studio_2.movies.create!(title: 'Harry Potter 1', creation_year: 2001, genre: 'Drama')
    visit '/studios'
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_3.title)
  end
end
