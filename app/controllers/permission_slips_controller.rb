class PermissionSlipsController < ApplicationController
  before_action :set_permission_slip, only: [:show, :edit, :update, :destroy]

  # GET /permission_slips
  # GET /permission_slips.json
  def index
    @permission_slips = PermissionSlip.all
  end

  # GET /permission_slips/1
  # GET /permission_slips/1.json
  def show
  end

  # GET /permission_slips/new
  def new
    @permission_slip = PermissionSlip.new
  end

  # GET /permission_slips/1/edit
  def edit
  end

  # POST /permission_slips
  # POST /permission_slips.json
  def create
    authorize PermissionSlip
    @permission_slip = PermissionSlip.new(permission_slip_params)

    respond_to do |format|
      if @permission_slip.save
        format.js
        format.html { redirect_to @permission_slip, notice: 'Permission Slip was successfully created.' }
        format.json { render :show, status: :created, location: @permission_slip }
      else
        format.js
        format.html { render :new }
        format.json { render json: @permission_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_slips/1
  # PATCH/PUT /permission_slips/1.json
  def update
    respond_to do |format|
      if @permission_slip.update(permission_slip_params)
        format.html { redirect_to @permission_slip, notice: 'Permission slip was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission_slip }
      else
        format.html { render :edit }
        format.json { render json: @permission_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_slips/1
  # DELETE /permission_slips/1.json
  def destroy
    @permission_slip.destroy
    respond_to do |format|
      format.html { redirect_to permission_slips_url, notice: 'Permission slip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_slip
      @permission_slip = PermissionSlip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_slip_params
      params.require(:permission_slip).permit(:type, :trip_id, :student_id)
    end
end
