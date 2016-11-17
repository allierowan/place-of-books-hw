class ReservationsController < ApplicationController

  def show
    @book = Book.find(params["book_id"])
    @reservation = Reservation.find(params["id"])
  end

  def index
    @book = Book.find(params["book_id"])
  end

  def new
    @book = Book.find(params["book_id"])
    @reservation = @book.reservations.build(due_date: Date.today + 5)
    render :new
  end

  def create
    @book = Book.find(params["book_id"])
    @reservation = @book.reservations.build(reservation_params)

    if @reservation.save
      redirect_to book_reservations_path(params["book_id"])
    else
      render :new_book_reservation
    end
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :book_id)
  end

  def reservation_return
    @book = Book.find(params["book_id"])
    @reservation = Reservation.find(params["reservation_id"])
    @reservation.return!
    redirect_to book_reservations_path
  end

  def edit
    @book = Book.find(params["book_id"])
    @reservation = Reservation.find(params["id"])
  end

  def update
    @reservation = Reservation.find(params["id"])
    @book = Book.find(params["book_id"])
    if @reservation.update(reservation_params)
      redirect_to book_reservations_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params["book_id"])
    Reservation.find(params["id"]).destroy
    redirect_to book_reservations_path
  end

  def return
    @book = Book.find(params["book_id"])
    Reservation.find(params["id"]).return!
    redirect_to book_reservations_path
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :book_id)
  end
end
