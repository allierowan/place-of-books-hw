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
    assert_match(/Create a reservation/, response.body)
  end

  test "should get show" do
    get reservation_path(reservations(:one).id)
    assert_response :success
    assert_match(/Allie/, response.body)
  end

end
