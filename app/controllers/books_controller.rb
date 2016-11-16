class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def search
    @books = Book.where("name LIKE ?", "%#{params['q']}%")
    render :index
  end

  def books_reservations
    @book = Book.find(params["id"])
  end

  def reserve_book
    @book = Book.find(params["id"])
    @reservation = @book.reservations.build(due_date: Date.today + 5)
    render :new_reservation
  end

  def create_reservation
    @book = Book.find(params["id"])
    @reservation = @book.reservations.build(reservation_params)

    if @reservation.save
      redirect_to reservations_book_path(params["id"])
    else
      render :new_reservation
    end
  end

  def book_params
    params.require(:book).permit(:name, :description, :isbn_number, :author)
  end

  def reservation_params
    params.require(:reservation).permit(:name, :due_date, :book_id)
  end

  def reservation_return
    @book = Book.find(params["id"])
    @reservation = Reservation.find(params["reservation_id"])
    @reservation.return!
    redirect_to reservations_book_path
  end
end
