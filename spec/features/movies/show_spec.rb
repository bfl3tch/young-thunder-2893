require 'rails_helper'

RSpec.describe 'The Movie Show Page' do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')
    @movie_1 = @studio_1.movies.create!(title: 'Blow', creation_year: 2003, genre: 'Drama')
    visit "/movies/#{@movie_1.id}"
  end

  it 'displays each movies title, creation year, and genre' do
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  it 'lists all of the movies actors from youngest to oldest'

  it 'displays the average age of all of the movies actors'
end
