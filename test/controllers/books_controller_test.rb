require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_path
    assert_response :success
    assert_match(/Library/, response.body)
  end

  test "should get new" do
    get new_book_path
    assert_response :success
    assert_match(/Title/, response.body)
  end

  test "can add new book" do
    post books_path params: { book: { name: "Ender's Game", description: "My fave book!", isbn_number: "9039410" } }
    assert_response :redirect
    assert_equal "Ender's Game", Book.last.name
  end

  test "can view specific book" do
    enders_game = Book.create!(name: "Ender's Game", description: "My fave")
    get book_path(enders_game.id)
    assert_match(/Edit this book/, response.body)
  end

  test "can edit a specific book" do
    enders_game = Book.create!(name: "Ender's Game", description: "My fave")
    patch book_path(enders_game.id), params: { book: { description: "It's really good" } }
    assert_equal "It's really good", Book.last.description
  end

  test "can delete a specific book" do
    enders_game = Book.create!(name: "Ender's Game", description: "My fave")
    delete book_path(enders_game.id)
    refute Book.find_by(id: enders_game.id)
  end

  test "can search for a book by title" do
    Book.create!(name: "Ender's Game", description: "My fave")
    post search_books_path params: { q: "Ender" }
    assert_response :success
    assert_match(/Ender/, response.body)
  end

  test "can get reservations list for book" do
    get book_reservations_path(books(:among_others).id)
    assert_response :success
    assert_match(/Allie Rowan/, response.body)
  end

  test "can get form to reserve specific book" do
    get reservations_new_book_path(books(:among_others).id)
    assert_response :success
    assert_match(/Reserve Among Others/, response.body)
  end

  test "can reserve specific book" do
    post book_reservations_path(books(:among_others).id), params: { reservation: { name: "Peter Wiggin", due_date: Date.tomorrow } }
    assert_equal "Peter Wiggin", Reservation.last.name
  end

end
