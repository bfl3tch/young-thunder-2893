class FilmsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by name: params[:actor_name]
    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end
end
