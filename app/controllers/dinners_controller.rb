class DinnersController < ApplicationController
  def index
    @past_dinners = (Dinner.all.select { |dinner| dinner.date.past? }).sort_by &:date
    @present_dinners = Dinner.all.select { |dinner| dinner.date.today? }
    @future_dinners = (Dinner.all.select { |dinner| dinner.date.future? }).sort_by &:date
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
    @dinner = Dinner.find params[:id]
  end
 
  def update
    @dinner = Dinner.find params[:id]
    if @dinner.update_attributes params[:dinner]
      flash[:notice] = "Dinner updated successfully."
      redirect_to action: "index"
    else
      flash.now[:alert] = @dinner.errors.full_messages.join("<br>").html_safe
      render action: "edit"
    end
  end

  def show
  end

  def destroy
    Dinner.find(params[:id]).destroy
    flash[:notice] = "Dinner deleted successfully."
    redirect_to action: "index"
  end
end
