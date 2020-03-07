class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
