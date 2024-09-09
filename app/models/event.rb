class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_one_attached :photo

  validates :title, :location, :description, :user, presence: true
  validates :title, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
  against: %I[title location], using: { tsearch: { prefix: true } }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
