# frozen_string_literal: true

class DashboardController < ActionController::Base
  before_action :authenticate_user!
end
