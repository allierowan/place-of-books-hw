class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
  end
end
