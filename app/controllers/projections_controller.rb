class ProjectionsController < ApplicationController
  before_action :set_projection, only: [:show, :update, :destroy]

  # GET /projections
  def index
    @projections = Projection.all

    render json: @projections
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
    params.permit(:showtime, :movie_id, :reservation_id)
  end
end
