class Medical < ActiveRecord::Base
  include Seasonal

  belongs_to :student
end
