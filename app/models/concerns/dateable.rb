module Dateable
  extend ActiveSupport::Concern

  included do
    rails_admin do
      include_all_fields
      field :date do
        strftime_format '%Y-%m-%d'
      end
    end
  end
end
