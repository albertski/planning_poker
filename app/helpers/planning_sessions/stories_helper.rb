# frozen_string_literal: true

module PlanningSessions
  module StoriesHelper
    def format_vote(vote)
      vote_display = if vote.nil?
                       '-'
                     elsif (vote % 1).zero?
                       vote.to_i
                     else
                       vote
                     end

      css_class = vote.nil? ? 'bg-gray-200 text-gray-700' : 'bg-blue-200 text-blue-700'

      content_tag(:span, vote_display, class: "inline-block px-3 py-1 rounded-full #{css_class}")
    end
  end
end
