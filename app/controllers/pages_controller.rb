class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :dashboard
  def home
  end

  def dashboard
    @bookings = current_user.bookings
  end
end
