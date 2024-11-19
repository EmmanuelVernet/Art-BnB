class BookingsController < ApplicationController
  before_action :set_art #, except: [:destroy]
  before_action :set_booking, only: [:show, :edit, :update] # find by ID only on these actions
  def index
    @bookings = @art.bookings
  end

  def show
    @booking = @art.bookings.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.art = @art
    @booking.save
    redirect_to art_path(@art)
  end

  def edit
    @booking = @art.bookings.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to art_path(@art)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_art
    @art = Art.find(params[:art_id])
  end
end

