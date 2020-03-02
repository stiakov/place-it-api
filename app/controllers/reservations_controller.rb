# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = nil
    @selected = Projection.find_by(showtime: params[:showtime], movie_id: params[:id].to_i)
    @control = false

    if available_seats?(@selected)
      @user = User.find_by_id_number(params[:id_number])
      if @user.nil?
        @user = User.create!(
          name: params[:name],
          mobile: params[:mobile],
          email: params[:email],
          id_number: params[:id_number]
        )
      end

      @reservation = @user.reservations.new(projection: @selected)
      @control = @reservation.save ? true : false

    end

    if @control
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.permit(:name, :mobile, :email, :id_number, :showtime, :id, :title, :plot, :poster, :projections, :reservation)
  end

  def available_seats?(projection)
    Reservation.all.where(projection_id: projection).count < 9
  end
end
