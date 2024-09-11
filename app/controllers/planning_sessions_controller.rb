# frozen_string_literal: true
#
class PlanningSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_planning_session, only: %i[ show edit update destroy ]

  def index
    @planning_sessions = PlanningSession.owned_by(current_user).order(created_at: :desc)
  end

  def show
  end

  def new
    @planning_session = PlanningSession.new
  end

  def edit
  end

  def create
    @planning_session = PlanningSession.new(planning_session_params)
    @planning_session.owner = current_user

    respond_to do |format|
      if @planning_session.save
        format.html { redirect_to planning_session_url(@planning_session), notice: "Planning session was successfully created." }
        format.turbo_stream.prepend 'planning_sessions', @planning_session
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @planning_session.update(planning_session_params)
        format.html { redirect_to planning_session_url(@planning_session), notice: "Planning session was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@planning_session) }
      end
    end
  end

  def destroy
    @planning_session.destroy!

    respond_to do |format|
      format.html { redirect_to planning_sessions_url, notice: "Planning session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_planning_session
      @planning_session = PlanningSession.find(params[:id])
    end

    def planning_session_params
      params.require(:planning_session).permit(:name)
    end
end
