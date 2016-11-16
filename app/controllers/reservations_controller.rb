class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params["id"])
  end

  def new
    @reservation = Reservation.new(due_date: Date.today + 5)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
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

  def return
    Reservation.find(params["id"]).return!
    redirect_to reservation_path
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :book_id)
  end
end
