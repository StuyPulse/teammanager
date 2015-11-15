module Buttonable
  extend ActiveSupport::Concern

  included do
    before_action :set_button, only: [:create, :destroy]
  end

  def set_button
    @button = params[:button]
  end
end
