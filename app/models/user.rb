class User < ApplicationRecord
  enum gender: {
    undisclosed: 0,
    female: 1,
    male: 2
  }

  has_many :bookings

  has_secure_password

  validates :email,    presence: true,
                       uniqueness: true,
                       format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true,
                       length: { minimum: 8 },
                       on: :create
  validates :password, length: { minimum: 8 },
                       allow_blank: true,
                       on: :update
end
