class RequiredPaymentsController < ApplicationController
  before_action :set_required_payment, only: [:show, :edit, :update, :destroy]

  # GET /required_payments
  # GET /required_payments.json
  def index
    @required_payments = RequiredPayment.all
  end

  # GET /required_payments/1
  # GET /required_payments/1.json
  def show
  end

  # GET /required_payments/new
  def new
    @required_payment = RequiredPayment.new
  end

  # GET /required_payments/1/edit
  def edit
  end

  # POST /required_payments
  # POST /required_payments.json
  def create
    @required_payment = RequiredPayment.new(required_payment_params)

    respond_to do |format|
      if @required_payment.save
        format.js
        format.html { redirect_to @required_payment, notice: 'Required payment was successfully created.' }
        format.json { render :show, status: :created, location: @required_payment }
      else
        format.html { render :new }
        format.json { render json: @required_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /required_payments/1
  # PATCH/PUT /required_payments/1.json
  def update
    respond_to do |format|
      if @required_payment.update(required_payment_params)
        format.html { redirect_to @required_payment, notice: 'Required payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @required_payment }
      else
        format.html { render :edit }
        format.json { render json: @required_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /required_payments/1
  # DELETE /required_payments/1.json
  def destroy
    @required_payment.destroy
    respond_to do |format|
      format.html { redirect_to required_payments_url, notice: 'Required payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_required_payment
      @required_payment = RequiredPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def required_payment_params
      params.require(:required_payment).permit(:trip_id, :type, :amount)
    end
end
