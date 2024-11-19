class BookingsController < ApplicationController
  before_action :set_art, except: [:destroy]
  defore_action :set_booking
  def index
    @bookings = @art.booking
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

