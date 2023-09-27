class Hostel < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates_presence_of :desc
  validates_presence_of :landmark
  validates_presence_of :address
  validates_presence_of :zipcode
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :img
end
