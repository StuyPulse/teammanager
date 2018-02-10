class Medical < ApplicationRecord
  include Dateable

  has_paper_trail

  belongs_to :student

  validates :date, :student_id, presence: true

  scope :valid, -> { where('date > ?', Date.today - 1.year) }

  rails_admin do
    list do
      field :student do
        queryable true
        searchable [:first_name, :last_name]
      end
      field :date
      include_all_fields
    end
  end

  def good?
    date <= Date.today && Date.today < date + 1.year
  end

  def self.good_for_trip(trip)
    where('date <= ? AND date > ? AND date <= ? AND date > ?',
          trip.start_date,
          trip.start_date - 1.year,
          trip.end_date,
          trip.end_date - 1.year)
  end

  def name
    if date.nil?
      return "Medical"
    end

    "#{date.strftime("%F")} Medical"
  end
end
