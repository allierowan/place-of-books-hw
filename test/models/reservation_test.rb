require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "can return book for reservation" do
    my_id = reservations(:one).id
    Reservation.find(my_id).return!
    assert Reservation.find(my_id).returned_at
  end
end
