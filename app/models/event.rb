class Event < ApplicationRecord
  belongs_to :user
  has_many :ticket_types, dependent: :destroy
  has_many :tickets, through: :ticket_types
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :ticket_types, reject_if: :all_blank, allow_destroy: true

  has_one_attached :photo

  validates :title, :location, :description, :user, presence: true
  validates :title, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_location_and_date,
  against: %I[title location date], using: { tsearch: { prefix: true } }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
