class CommunityServicesController < ApplicationController
  before_action :set_community_service, only: [:destroy]

  # post /community_services
  # post /community_services.json
  def create
    @community_service = CommunityService.new(community_service_params)

    respond_to do |format|
      if @community_service.save
        @student = @community_service.student
        format.js
        format.html { redirect_to @community_service, notice: 'Community service was successfully created.' }
        format.json { render :show, status: :created, location: @community_service }
      else
        format.js
        format.html { render :new }
        format.json { render json: @community_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_services/1
  # DELETE /community_services/1.json
  def destroy
    @student = @community_service.student
    @community_service.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to community_services_url, notice: 'Community service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_service
      @community_service = CommunityService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_service_params
      params.require(:community_service).permit(:student_id, :year, :description, :hours)
    end
end
