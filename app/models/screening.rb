class Screening < ApplicationRecord
  has_many :bookings
  belongs_to :movie
  belongs_to :theatre

  def start_time
    start_at.strftime("%H:%m")
  end

  def booked? user_id
    bookings.where(user_id: user_id).first.present?
  end

  def in_the_past?
    current_time = Time.now
    start_at - start_at.midnight < current_time - current_time.midnight
  end

  def seat_available?
    seat_available > 0
  end

  def seat_available
    theatre.capacity - bookings.count
  end
end
