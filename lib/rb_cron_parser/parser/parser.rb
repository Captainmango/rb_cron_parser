# frozen_string_literal: true

require_relative './rules'
require_relative './interval_total'
require 'pry'

module RbCronParser
  # Module to parse cron fragments into possible values
  #
  # Author: Edward Heaver
  module Parser
    class << self
      include RbCronParser::Rules
      include RbCronParser::IntervalTotal

      # Converts the cron object into a collection of parsed intervals with rules applied
      #
      # Returns a hash
      def parse(cron)
        %i[
          minute
          hour
          day_of_month
          month
          day_of_week
          filepath
        ].to_h do |var|
          chronounit = -1 # default when not matching any interval

          chronounit = IntervalTotal.const_get(var.to_s.upcase) if IntervalTotal.constants.include?(var.upcase)

          [var, parse_interval(cron.send(var), chronounit)]
        end

        # parsed_cron[:filepath] = cron.filepath
      end

      # Identifies what rule to apply to the cron fragment
      #
      # Returns a symbol
      def identify_rule(cronlet)
        case cronlet
        in /(^\d{1,2}-\d{1,2}$)/
          :range
        in /(^\d{1,2},\d{1,2}$)/
          :list
        in %r{(^\*/\d{1,2}$)}
          :modulo
        in /(^\*$)/
          :wildcard
        in /^(?:\w:|\\)/
          :default
        else
          :default
        end
      end

      private

      # Accepts cron fragment and interval and applies identified rule
      #
      # Returns an array
      def parse_interval(cronlet, chronounit)
        rule = identify_rule(cronlet)

        send(rule, cronlet, chronounit)
      end
    end
  end
end
