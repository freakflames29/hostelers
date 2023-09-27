class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :owner, presence: true
  validates :desc, presence: true, length: { maximum: 100 }
end
