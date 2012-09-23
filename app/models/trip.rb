class Trip < ActiveRecord::Base
  attr_accessible :end_date, :name, :requires_teacher_permission_form, :start_date
  has_many :parent_permission_forms
  has_many :teacher_permission_forms
  has_many :p_students, through: :parent_permission_forms, source: :student
  has_many :t_students, through: :teacher_permission_forms, source: :student
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def all_students
    (self.p_students + self.t_students).sort do |a, b|
      comp = a.last_name <=> b.last_name
      comp.zero? ? (a.first_name <=> b.first_name) : comp
    end
  end
end
