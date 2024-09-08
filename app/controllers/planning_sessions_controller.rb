# frozen_string_literal: true
#
class PlanningSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_planning_session, only: %i[ show edit update destroy ]

  # GET /planning_sessions or /planning_sessions.json
  def index
    @planning_sessions = PlanningSession.owned_by(current_user)
  end

  # GET /planning_sessions/1 or /planning_sessions/1.json
  def show
  end

  # GET /planning_sessions/new
  def new
    @planning_session = PlanningSession.new
  end

  # GET /planning_sessions/1/edit
  def edit
  end

  # POST /planning_sessions or /planning_sessions.json
  def create
    @planning_session = PlanningSession.new(planning_session_params)
    @planning_session.owner = current_user

    respond_to do |format|
      if @planning_session.save
        format.html { redirect_to planning_session_url(@planning_session), notice: "Planning session was successfully created." }
        format.json { render :show, status: :created, location: @planning_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planning_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planning_sessions/1 or /planning_sessions/1.json
  def update
    respond_to do |format|
      if @planning_session.update(planning_session_params)
        format.html { redirect_to planning_session_url(@planning_session), notice: "Planning session was successfully updated." }
        format.json { render :show, status: :ok, location: @planning_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @planning_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planning_sessions/1 or /planning_sessions/1.json
  def destroy
    @planning_session.destroy!

    respond_to do |format|
      format.html { redirect_to planning_sessions_url, notice: "Planning session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning_session
      @planning_session = PlanningSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def planning_session_params
      params.require(:planning_session).permit(:name)
    end
end
