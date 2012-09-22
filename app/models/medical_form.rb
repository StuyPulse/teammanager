class MedicalForm < ActiveRecord::Base
  attr_accessible :date
  belongs_to :student
end
