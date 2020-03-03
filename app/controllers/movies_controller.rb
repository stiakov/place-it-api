class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]
  before_action only: %i[create update] do
    sanitize_params(movie_params)
  end

  # GET /movies
  def index
    @movies = Movie.all.reverse_order
    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    from = params[:dates].first[:startDate].to_date
    to = params[:dates].first[:endDate].to_date
    Date.new(from.year, from.month, from.day).upto(Date.new(to.year, to.month, to.day)) do |date|
      Projection.create!(movie: @movie, showtime: date)
    end


    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def movie_params
    params.permit(:title, :plot, :poster, :dates)
  end
end
