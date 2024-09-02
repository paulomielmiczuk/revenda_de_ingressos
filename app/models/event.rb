class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets

  has_one_attached :photo
end
