require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get reservations_path
    assert_response :success
    assert_match(/Ender/, response.body)
  end

  test "should get new form" do
    get new_reservation_path
    assert_response :success
    assert_match(/New Reservation/, response.body)
  end

  test "can create new reservation" do
    post reservations_path params: { reservation: { name: "Lord Asriel", book_id: Book.last.id, due_date: Date.tomorrow } }
    assert_response :redirect
    assert_equal "Lord Asriel", Reservation.last.name
  end

  test "should get show" do
    get reservation_path(reservations(:one).id)
    assert_response :success
    assert_match(/Allie/, response.body)
  end

  test "can get edit form reservation" do
    get edit_reservation_path(reservations(:one).id)
    assert_response :success
    assert_match(/Edit/, response.body)
  end

  test "can update reservation" do
    patch reservation_path(reservations(:one).id), params: { reservation: { name: "Frenchy McGee" } }
    assert_response :redirect
    assert_equal "Frenchy McGee", Reservation.find(reservations(:one).id).name
  end

  test "can delete reservation" do
    delete reservation_path(reservations(:one).id)
    refute Reservation.find_by(id: reservations(:one).id)
  end

  test "can return book for reservation" do
    patch return_reservation_path(reservations(:one).id)
    assert Reservation.find(reservations(:one)).returned_at
  end

end
