class GenresController < ApplicationController

  def show
    current_genre
  end

  def new
    @genre=Genre.new
  end

  def create
    @genre=Genre.new(genre_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  def edit
    current_genre
  end

  def update
    current_genre
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def current_genre
    @genre=Genre.find(params[:id])
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
