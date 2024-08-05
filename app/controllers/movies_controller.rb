# frozen_string_literal: true

# Controller de Movies
class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Le film a été créé avec succès'
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Le film a été mis à jour'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Film effacé avec succès.'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
