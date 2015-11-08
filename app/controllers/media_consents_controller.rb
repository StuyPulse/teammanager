class MediaConsentsController < ApplicationController
  before_action :set_media_consent, only: [:destroy]

  # POST /media_consents
  # POST /media_consents.json
  def create
    @media_consent = MediaConsent.new(media_consent_params)

    respond_to do |format|
      if @media_consent.save
        @student = @media_consent.student
        format.js
        format.html { redirect_to @media_consent, notice: 'Media consent was successfully created.' }
        format.json { render :show, status: :created, location: @media_consent }
      else
        format.js
        format.html { render :new }
        format.json { render json: @media_consent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_consents/1
  # DELETE /media_consents/1.json
  def destroy
    @student = @media_consent.student
    @media_consent.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to media_consents_url, notice: 'Media consent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_consent
      @media_consent = MediaConsent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_consent_params
      params.require(:media_consent).permit(:student_id, :year)
    end
end
