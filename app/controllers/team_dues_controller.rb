class TeamDuesController < ApplicationController
  before_action :set_team_due, only: [:show, :edit, :update, :destroy]

  # GET /team_dues
  # GET /team_dues.json
  def index
    @team_dues = TeamDue.all
  end

  # GET /team_dues/1
  # GET /team_dues/1.json
  def show
  end

  # GET /team_dues/new
  def new
    @team_due = TeamDue.new
  end

  # GET /team_dues/1/edit
  def edit
  end

  # POST /team_dues
  # POST /team_dues.json
  def create
    @team_due = TeamDue.new(team_due_params)

    respond_to do |format|
      if @team_due.save
        format.html { redirect_to @team_due, notice: 'Team due was successfully created.' }
        format.json { render :show, status: :created, location: @team_due }
      else
        format.html { render :new }
        format.json { render json: @team_due.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_dues/1
  # PATCH/PUT /team_dues/1.json
  def update
    respond_to do |format|
      if @team_due.update(team_due_params)
        format.html { redirect_to @team_due, notice: 'Team due was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_due }
      else
        format.html { render :edit }
        format.json { render json: @team_due.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_dues/1
  # DELETE /team_dues/1.json
  def destroy
    @team_due.destroy
    respond_to do |format|
      format.html { redirect_to team_dues_url, notice: 'Team due was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_due
      @team_due = TeamDue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_due_params
      params.require(:team_due).permit(:year, :student_id)
    end
end
