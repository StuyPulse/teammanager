class Service < ApplicationRecord
  has_paper_trail

  belongs_to :student
  belongs_to :event

  before_validation :set_default_hours

  validates :hours, numericality: { greater_than: 0 }, presence: true

  rails_admin do
    list do
      field :event do
        queryable true
        searchable :name
      end
      field :student do
        queryable true
        searchable [:first_name, :last_name]
      end
      field :hours
    end
  end

  def set_default_hours
    self.hours ||= event.default_hours
  end
end
