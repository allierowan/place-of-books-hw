require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get reservations_path
    assert_response :success
    assert_match(/Ender/, response.body)
  end

  test "should get new" do
    get new_reservation_path
    assert_response :success
    assert_match(/New Book Reservation/, response.body)
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
    assert_equal "Frenchy McGee", Reservation.find(reservations(:one).id).name
  end

  test "can delete reservation" do
    delete reservation_path(reservations(:one).id)
    refute Reservation.find_by(id: reservations(:one).id)
  end

end
