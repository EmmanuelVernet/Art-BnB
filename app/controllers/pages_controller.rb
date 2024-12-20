class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :dashboard
  def home
  end

  def dashboard
    @bookings = current_user.bookings
    # @arts = Art.joins(:bookings)
    # .where(user_id: current_user.id)
    # .where(bookings: { status: "accepted", user_id: current_user.id })
    # .distinct
    @booking_pending = Art.joins(:bookings).where(bookings: { status: "pending", user_id: current_user.id }).distinct
    @booking_validated = Art.joins(:bookings).where(bookings: { status: "accepted", user_id: current_user.id }).distinct
    @booking_declined = Art.joins(:bookings).where(bookings: { status: "declined", user_id: current_user.id }).distinct
    @arts = Art.where(user: current_user)
    @my_booking_pending = Booking.where(status: "pending", art_id: @arts.pluck(:id))
    @my_booking_validated = Booking.where(status: "accepted", art_id: @arts.pluck(:id))
    @my_booking_declined = Booking.where(status: "declined", art_id: @arts.pluck(:id))
  end
end
