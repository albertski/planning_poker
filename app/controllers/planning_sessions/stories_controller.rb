# frozen_string_literal: true

module PlanningSessions
  class StoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_planning_session
    before_action :set_story, only: %i[edit update]

    def new
      @story = @planning_session.stories.build
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    end

    def create
      @story = PlanningSessions::Story.new(story_params)
      @story.planning_session = @planning_session

      respond_to do |format|
        if @story.save
          format.html { redirect_to planning_session_url(@planning_session.uuid) }
          format.turbo_stream
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    end

    def update
      respond_to do |format|
        if @story.update(story_params)
          format.html { redirect_to planning_session_url(@planning_session.uuid) }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.turbo_stream { render :edit, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_planning_session
      @planning_session = PlanningSession.find_by!(uuid: params[:planning_session_uuid])
    end

    def story_params
      params.require(:story).permit(:title)
    end

    def set_story
      @story = @planning_session.stories.find(params[:id])
    end
  end
end
