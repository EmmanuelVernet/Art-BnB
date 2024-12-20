class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_art
  before_action :set_booking, only: [:show, :edit, :update, :accept, :decline ] # find by ID only on these actions


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
    # raise
    selected_dates = params[:booking][:start_date].split("to")
    start_date = selected_dates[0]
    end_date = selected_dates[1]
    @booking = Booking.new(start_date: start_date, end_date: end_date)
    @booking.art = @art
    @booking.user = current_user
    @booking.status = :pending # default status at booking creation
    if @booking.save
      redirect_to art_booking_path(@booking.art_id, @booking)
    else
      @form_visible = true
      render 'arts/show', status: :unprocessable_entity
    end
  end

  def edit
    @booking = @art.bookings.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to art_path(@art)
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to dashboard_path, notice: "Booking accepted."
  end

  def decline
    @booking.update(status: "declined")
    redirect_to dashboard_path, alert: "Booking declined."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_art
    @art = Art.find(params[:art_id])
  end
end
