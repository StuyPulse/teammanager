class StaticController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :forms]
  skip_after_action :verify_authorized

  def home
  end

  def forms
  end
end
