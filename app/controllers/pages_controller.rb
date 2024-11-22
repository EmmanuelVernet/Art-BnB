class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :dashboard
  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @arts = Art.where(user_id: current_user.id)
    @arts_pending = Art.joins(:bookings).where(bookings: { status: 0, user_id: current_user.id }).distinct
  end

end
