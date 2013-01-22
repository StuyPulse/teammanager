class DinnersController < ApplicationController
  def index
    @dinners = Dinner.all.sort_by &:date
  end

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new params[:dinner]
    if @dinner.save
      flash[:notice] = "Dinner created successfully."
      redirect_to controller: 'dinners'
    else
      flash.now[:alert] = @dinner.errors.full_messages.join("<br>").html_safe
      render action: "new"
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end
end
