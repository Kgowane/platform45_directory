class User < ApplicationRecord
  has_one :address, dependent: :destroy
  validates :first_name, :last_name, presence: true,
            length: { minimum: 2 }
  validates :age, presence: true
end
