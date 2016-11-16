class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params["id"])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params["id"])
  end

  def update
    @reservation = Reservation.find(params["id"])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    Reservation.find(params["id"]).destroy
    redirect_to reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :book_id, :overdue)
  end
end
