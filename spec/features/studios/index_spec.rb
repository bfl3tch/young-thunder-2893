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
end
