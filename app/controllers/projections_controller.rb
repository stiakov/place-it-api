# frozen_string_literal: true

class ProjectionsController < ApplicationController
  before_action :set_projection, only: %i[show update destroy]
  before_action only: %i[create update] do
    sanitize_params(projection_params)
  end

  # GET /projections
  def index
    @projections = Projection.all
    render json: @projections
  end

  # GET /projections/filter/YYYY-MM-DD
  def filter
    parsed_date = Date.parse(projection_params[:showtime])
    @projections = Projection.by_day(parsed_date)
    if @projections.empty?
      render json: { movies: []
      }, status: :not_found
    else
      render json: @projections.map(&:movie)
    end
  end

  # GET /projections/1
  def show
    render json: @projection
  end

  # POST /projections
  def create
    @projection = Projection.new(projection_params)

    if @projection.save
      render json: @projection, status: :created, location: @projection
    else
      render json: @projection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projections/1
  def update
    if @projection.update(projection_params)
      render json: @projection
    else
      render json: @projection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projections/1
  def destroy
    @projection.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_projection
    @projection = Projection.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def projection_params
    params.permit(:id, :showtime, :movie_id, :reservation_id)
  end
end
