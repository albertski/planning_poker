# frozen_string_literal: true

module PlanningSessions
  class Stories < ActionController::Base
    enum status: { incomplete: 0, voting: 1, complete: 2 }
  end
end
