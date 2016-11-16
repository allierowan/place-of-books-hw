class Reservation < ApplicationRecord
  belongs_to :book

  def return!
    self.returned_at = Date.today
    self.save!
  end

  def returned?
    self.returned_at == nil
  end
end
